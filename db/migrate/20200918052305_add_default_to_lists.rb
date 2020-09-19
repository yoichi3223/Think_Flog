class AddDefaultToLists < ActiveRecord::Migration[5.2]
  def change
  	change_column :lists, :genre_id, :integer, null: false
  end
end
