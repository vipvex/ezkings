class CartController < ApplicationController
  before_action :authenticate_user!

  protect_from_forgery :except => [:charge_camp]

  
  def cart
    @cart = current_user.cart
    @shipping_options = ShippingOption.all
  end
  
  def update
    @cart = Cart.find(cart_params[:cart_id])
    @cart.update(zip_code: cart_params[:zip_code], country: cart_params[:country], shipping_option_id: cart_params[:shipping_option_id])
    
    redirect_to cart_path
  end
  
  def add_cart_item
    @card = Card.find(cart_params[:card_id])
    
    cart_item = current_user.cart.cart_items.find_by(item_id: @card.id)
    
    quantity = cart_params[:quantity].to_i
    
    quantity = @card.available if quantity > @card.available 
    
    @cart_item = cart_item.update(quantity: quantity) if @card && cart_item
    @cart_item = current_user.cart.add(@card, @card.price, quantity) if @card && !cart_item
    
    redirect_to cart_path
  end
  
  def remove_item
    @cart_item = current_user.cart.cart_items.find_by(item_id: cart_params[:cart_item_id])
    @cart_item.destroy if @cart_item
    redirect_to cart_path
  end

  def purchase
  
    @cart = Cart.find(cart_params[:cart_id])
    
    @cart.purchase
    
    redirect_to purchase_complete_path
  end

  def purchase_complete
    @cart = current_user.carts.purchased.last
  end
  
  def orders
    
    @carts = current_user.carts.purchased.order(updated_at: :DESC)
    
  end
  
  def stripe_charge 

    @cart = Cart.find(cart_params[:cart_id])
    
    if @cart.nil?
      flash[:notice] = "Couldn't find cart"
      redirect_to cart_path and return false
    end
    
    begin
    
      @amount = @cart.total_in_cents.to_i
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @cart.stripe_description,
        :currency    => 'usd'
      )
      
      flash[:notice] = 'Order Complete'
      
      @cart.purchase
      
    rescue Stripe::CardError => e
      flash[:notice] = e.error
    rescue => e
      flash[:notice] = e.message
      puts "\n#{e.message}\n"
      redirect_to cart_path and return false
    end

    respond_to do |format|
      format.html { redirect_to purchase_complete_path }
    end
  end
  
  
  # TEST
  
  def charge_camp
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = "sk_test_KZO10MY1szX06lOwBhTb6tmC"
    
    # Token is created using Stripe.js or Checkout!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]
    
    # Charge the user's card:
    charge = Stripe::Charge.create(
      :amount => 84900,
      :currency => "usd",
      :description => "Camp Charge",
      :source => token,
    )
    
    render :json => { name: "boom! Success" }
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:cart_item_id, :card_id, :cart_id, :quantity, :zip_code, :country, :cart_id, :shipping_option_id)
    end
end
