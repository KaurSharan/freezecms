class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
    	t.string "user_id"
    	t.string "name",:limit=>25
    	t.string "link",:limit=>25
    	t.integer "position"
      t.timestamps null: false
    end
    add_index("Menus","name")
  end
end
