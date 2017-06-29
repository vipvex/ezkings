class CreateCardManufacturersCards < ActiveRecord::Migration
  def change
    create_table :card_manufacturers_cards do |t|
      t.references :card, index: true, foreign_key: true
      t.references :card_manufacturers, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
