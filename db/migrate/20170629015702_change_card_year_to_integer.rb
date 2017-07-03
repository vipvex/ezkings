class ChangeCardYearToInteger < ActiveRecord::Migration
  def change
    #change_column :cards, :year, :integer
    remove_column :cards, :year
    add_column :cards, :year, :integer
  end
end
