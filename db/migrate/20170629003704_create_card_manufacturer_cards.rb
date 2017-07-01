class CreateCardManufacturerCards < ActiveRecord::Migration
  def change
    create_table :card_manufacturer_cards do |t|
      t.references :card, index: true, foreign_key: true
      t.references :card_manufacturer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
