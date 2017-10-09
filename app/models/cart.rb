class Cart < ActiveRecord::Base
  
  acts_as_shopping_cart_using :cart_item
  
  
  belongs_to :user
  belongs_to :shipping_option
  
  
  scope :purchased, -> { where(purchased: true) }

  
  def shipping_cost
    Money.new(shipping_price)
  end
  
  def tax_pct
    if self.state == 'CA'
      Tax.first.tax
    else
      0
    end
  end

  def paypal_items 
    items = []
    cart_items.each do |item|
      items.push ({ 
        "name" => item.item.name,
        "description" => item.item.description,
        "sku" => item.item.sku && !item.item.sku.empty? ? item.item.sku : "No SKU set",
        "price" => item.item.price,
        "currency" => "USD",
        "quantity" => item.quantity
      })
    end
    
    items.to_json
  end
  
  def stripe_description
    items = []
    cart_items.each do |item|
      items.push "Shipping Option: #{shipping_option.name}, Shipping Price: #{shipping_option.price}, 1) Card Name: #{item.item.name}, SKU: #{item.item.sku}, Price: $#{item.item.price}, Quantity: #{item.quantity}"
    end
    
    items.join(' ')
  end
  
  def purchase
  
    return false if self.purchased?
  
    cart_items.each do |item|
      
      item.item.update(available: item.item.available - item.quantity)
      
    end
  
    self.update(purchased: true)
    
    # Create new cart for user
    Cart.create(user_id: self.user_id, shipping_option_id: ShippingOption.first.id)
  end
  
  def empty?
    cart_items.empty?
  end

  def zip_code_set?
    self.zip_code && !zip_code.empty?
  end

  def total_in_cents
    self.total * 100 
  end
  
  def shipping_price
    shipping_option.price
  end
  
  def purchased?
    self.purchased
  end
  
end
