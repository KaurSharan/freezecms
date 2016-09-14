class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
    	t.integer "user_id"
    	t.string "first_name",:limit=>25
    	t.string "last_name",:limit=>25
    	t.string "profile_pic",:limit=>25
    	t.string "email",:limit=>40
    	t.string "number",:limit=>25
      t.timestamps null: false
    end
    add_index("User_Details","user_id")
    add_index("User_Details","first_name")
  end
end
