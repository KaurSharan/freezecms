class CreatePronames < ActiveRecord::Migration
  def change
    create_table :pronames do |t|
    	t.integer "user_id"
    	t.string "name",:limit=>25
      t.timestamps null: false
    end
  end
end
