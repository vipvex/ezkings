class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.date :year
      t.text :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
