class CreateCardAttributes < ActiveRecord::Migration
  def change
    create_table :card_attributes do |t|
      t.references :card, index: true, foreign_key: true
      t.references :attribute, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
