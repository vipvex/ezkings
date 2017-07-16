class DeleteCartsZipCode < ActiveRecord::Migration
  def change
    drop_table :carts  
  end
end
