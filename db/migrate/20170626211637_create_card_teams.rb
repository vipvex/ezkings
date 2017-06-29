class CreateCardTeams < ActiveRecord::Migration
  def change
    create_table :card_teams do |t|
      t.references :card, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
