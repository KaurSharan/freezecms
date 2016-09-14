class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string "email",:limit=>40
    	t.string "password",:limit=>25
    	t.boolean "is_admin",:default=>false
    	t.boolean "is_active",:default=>true
      t.timestamps null: false
    end
    add_index("users","email")
  end
end
