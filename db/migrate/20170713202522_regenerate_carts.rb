class RegenerateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true, foreign_key: true
      
      t.string :zip_code
      t.string :country, default: 'US'
      t.boolean :purchased, default: false
  
      t.string :shipping_option
      t.integer :shipping_price, default: 0
  
      t.timestamps null: false
    end
  end
end
