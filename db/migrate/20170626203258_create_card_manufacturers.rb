class CreateCardManufacturers < ActiveRecord::Migration
  def change
    create_table :card_manufacturers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
