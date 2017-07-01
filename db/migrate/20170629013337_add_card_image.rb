class AddCardImage < ActiveRecord::Migration
  def change
    add_column :cards, :front_image_url, :string
    add_column :cards, :back_image_url, :string
  end
end
