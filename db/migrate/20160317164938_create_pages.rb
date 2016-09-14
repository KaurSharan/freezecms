class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.integer "submenu_id"
    	t.integer "banner_id"
    	t.string "title",:limit=>25
    	t.string "description"
      t.timestamps null: false
    end
    add_index("Pages","submenu_id")
    add_index("Pages","banner_id")
  end
end
