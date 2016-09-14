class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
    	t.string "name",:limit=>25
    	t.string "email",:limit=>40
    	t.string "comment"
      t.timestamps null: false
    end
  end
end
