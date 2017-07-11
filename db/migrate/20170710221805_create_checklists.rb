class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :name
      t.integer :order
      t.string :url
      t.text :content

      t.timestamps null: false
    end
  end
end
