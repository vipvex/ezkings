class CartController < ApplicationController
  def cart
    @cart = current_user.cart
  end
  
  def add_item
    @card = Card.find(params[:card_id])
    @cart_item = current_user.cart.add(@card, @card.price, 1) if @card
    redirect_to cart_path
  end
  
  def remove_item
    @cart_item = CartItem.find_by(params[:cart_item_id])
    @cart_item.destroy if @cart_item
    redirect_to cart_path
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:cart_item_id, :card_id)
    end
end
