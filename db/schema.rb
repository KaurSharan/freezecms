# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160918140933) do

  create_table "backgrounds", force: :cascade do |t|
    t.integer  "page_id",    limit: 4
    t.string   "photo",      limit: 200
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "backgrounds", ["page_id"], name: "index_Backgrounds_on_page_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.string   "banner_type", limit: 25
    t.string   "detail",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "banners", ["page_id"], name: "index_Banners_on_page_id", using: :btree

  create_table "blogcomments", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255
    t.text     "detail",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "contacts", ["user_id"], name: "index_Contacts_on_user_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.string   "name",       limit: 25
    t.string   "email",      limit: 40
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name",       limit: 25
    t.string   "link",       limit: 25
    t.integer  "position",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "menus", ["name"], name: "index_Menus_on_name", using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "submenu_id",  limit: 4
    t.integer  "banner_id",   limit: 4
    t.string   "title",       limit: 25
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pages", ["banner_id"], name: "index_Pages_on_banner_id", using: :btree
  add_index "pages", ["submenu_id"], name: "index_Pages_on_submenu_id", using: :btree

  create_table "pronames", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 25
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.integer  "page_id",    limit: 4
    t.string   "pic",        limit: 25
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "sliders", ["page_id"], name: "index_Sliders_on_page_id", using: :btree

  create_table "submenus", force: :cascade do |t|
    t.integer  "menu_id",    limit: 4
    t.string   "name",       limit: 25
    t.string   "link",       limit: 25
    t.integer  "position",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "first_name",  limit: 25
    t.string   "last_name",   limit: 25
    t.string   "profile_pic", limit: 25
    t.string   "number",      limit: 25
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_details", ["first_name"], name: "index_User_Details_on_first_name", using: :btree
  add_index "user_details", ["user_id"], name: "index_User_Details_on_user_id", using: :btree

  create_table "userdetails", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "first_name",  limit: 25
    t.string   "last_name",   limit: 25
    t.string   "profile_pic", limit: 25
    t.string   "email",       limit: 40
    t.string   "number",      limit: 25
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "userdetails", ["first_name"], name: "index_UserDetails_on_first_name", using: :btree
  add_index "userdetails", ["user_id"], name: "index_UserDetails_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",      limit: 40
    t.string   "password",   limit: 25
    t.boolean  "is_admin",              default: false
    t.boolean  "is_active",             default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
