class ChangeCardYearToInteger < ActiveRecord::Migration
  def change
    change_column :cards, :year, :integer
  end
end
