class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
    	t.string :title, null: false
    	t.integer :status, null: false
      	t.timestamps
    end
  end
end
