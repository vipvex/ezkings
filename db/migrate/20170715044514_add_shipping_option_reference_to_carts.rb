class AddShippingOptionReferenceToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :shipping_option, index: true, foreign_key: true
  end
end
