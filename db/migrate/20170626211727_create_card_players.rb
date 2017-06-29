class CreateCardPlayers < ActiveRecord::Migration
  def change
    create_table :card_players do |t|
      t.references :card, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
