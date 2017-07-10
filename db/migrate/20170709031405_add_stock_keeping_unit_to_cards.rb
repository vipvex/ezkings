class AddStockKeepingUnitToCards < ActiveRecord::Migration
  def change
    add_column :cards, :sku, :string
  end
end
