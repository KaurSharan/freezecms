class CreateUserdetails < ActiveRecord::Migration
  def change
    create_table :userdetails do |t|
    	t.integer "user_id"
    	t.string "first_name",:limit=>25
    	t.string "last_name",:limit=>25
    	t.string "profile_pic",:limit=>25
    	t.string "email",:limit=>40
    	t.string "number",:limit=>25
      t.timestamps null: false
    end
  end
end
