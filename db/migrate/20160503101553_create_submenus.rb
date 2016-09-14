class CreateSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
    	t.integer "menu_id"
    	t.string "name",:limit=>25
    	t.string "link",:limit=>25
    	t.integer "position"
      t.timestamps null: false
    end
  end
end
