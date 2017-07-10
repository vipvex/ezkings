class Cart < ActiveRecord::Base
  belongs_to :user
  acts_as_shopping_cart_using :cart_item
  
  scope :purchased, -> { where(purchased: true) }
  
  def taxes
    0
    #(subtotal - 10) * 0
  end

  def paypal_items 
    items = []
    cart_items.each do |item|
      items.push ({ 
        "name" => item.item.name,
        "sku" => 1,
        "price" => item.item.price,
        "currency" => "USD",
        "quantity" => item.quantity,
        "description" => item.item.description
      })
    end
    
    items.to_json
  end
  
  def purchase
  
    cart_items.each do |item|
      
      item.item.update(available: item.item.available - item.quantity)
      
    end
  
    self.update(purchased: true)
    
    # Create new cart for user
    Cart.create(user_id: self.user_id)
  end
  
  def empty?
    cart_items.empty?
  end
  
end
