class AddZipCodeToCart < ActiveRecord::Migration
  def change
    add_column :carts, :zip_code, :string
    add_column :carts, :country, :string
  end
end
