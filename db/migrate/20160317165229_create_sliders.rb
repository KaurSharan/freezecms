class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
    	t.integer "page_id"
    	t.string "pic",:limit=>25
      t.timestamps null: false
    end
    add_index("Sliders","page_id")
  end
end
