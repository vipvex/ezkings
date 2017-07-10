class AddPurchasedToCart < ActiveRecord::Migration
  def change
    add_column :carts, :purchased, :boolean, default: false
  end
end
