class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
    	t.integer "page_id"
    	t.string "photo",:limit=>25
      t.timestamps null: false
    end
  end
end
