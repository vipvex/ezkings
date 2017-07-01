class AddCardAvailable < ActiveRecord::Migration
  def change
    add_column :cards, :available, :integer
  end
end
