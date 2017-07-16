class CreateCardHighlights < ActiveRecord::Migration
  def change
    create_table :card_highlights do |t|
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
