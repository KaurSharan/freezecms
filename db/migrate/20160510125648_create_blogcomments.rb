class CreateBlogcomments < ActiveRecord::Migration
  def change
    create_table :blogcomments do |t|
    	t.integer "blog_id"
    	t.string "comment" 
      t.timestamps null: false
    end
  end
end
