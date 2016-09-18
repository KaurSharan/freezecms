class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
    	t.integer "page_id"
    	t.string "banner_type",:limit=>25
    	t.string "detail"
      t.timestamps null: false
    end
  end
end
