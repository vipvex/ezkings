class CartController < ApplicationController
  before_action :authenticate_user!

  
  def cart
    @cart = current_user.cart
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
    
  end
  
  def orders
    
    @carts = current_user.carts.purchased
    
  end

  def create
    @order = @cart.build_order(order_params)
    @order.ip = request.remote_ip
  
    if @order.save
      if @order.purchase # this is where we purchase the order. refer to the model method below
        redirect_to order_url(@order)
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
  
  def stripe_charge 
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = "sk_test_6OopydYgYGr5KKqj65cS81dD"
    
    # Token is created using Stripe.js or Checkout!
    # Get the payment token submitted by the form:
    token = params[:stripeToken]
    
    # Charge the user's card:
    charge = Stripe::Charge.create(
      :amount => 1000,
      :currency => "usd",
      :description => "Example charge",
      :source => token,
    )
    
    redirect_to marketplace_path
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:cart_item_id, :card_id, :cart_id, :quantity)
    end
end
