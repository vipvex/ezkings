class SerialNumberToCards < ActiveRecord::Migration
  def change
    add_column :cards, :serial_number, :string
  end
end
