class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.float :tax

      t.timestamps null: false
    end
  end
end
