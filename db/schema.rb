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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121231140126) do

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "parent_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "blog_post_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "content_suggestions", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "user_id"
    t.string   "title"
    t.string   "cat_1"
    t.string   "cat_2"
    t.string   "cat_3"
    t.string   "summary"
    t.string   "goal"
    t.string   "market"
    t.string   "audience"
    t.string   "other_available_product"
    t.text     "product"
    t.text     "content_overview"
    t.string   "illustration"
    t.string   "marketing_promotion"
    t.string   "author_qualification"
    t.string   "appendice"
  end

  create_table "discussion_posts", :force => true do |t|
    t.string   "content"
    t.integer  "replied_post_id"
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "subject"
    t.string   "comment"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "glossary_entries", :force => true do |t|
    t.string   "name"
    t.string   "short_definition"
    t.text     "full_definition"
    t.string   "pronun_file"
    t.string   "image_file"
    t.string   "ext_link"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "glossary_entries_lessons", :id => false, :force => true do |t|
    t.integer "glossary_entry_id"
    t.integer "lesson_id"
  end

  create_table "lesson_ratings", :force => true do |t|
    t.integer  "rating"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "less.sass", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "script"
    t.string   "audio_file"
    t.string   "video_file"
    t.string   "author"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.string   "image_file"
  end

  add_index "lessons", ["slug"], :name => "index_lessons_on_slug", :unique => true

  create_table "lessons_tags", :id => false, :force => true do |t|
    t.integer "lesson_id"
    t.integer "tag_id"
  end

  create_table "objectives", :force => true do |t|
    t.string   "title"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "question_ratings", :force => true do |t|
    t.integer  "rating"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.string   "answer"
    t.string   "answered_by"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "references", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "photo"
    t.integer  "lesson_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "mail_address"
    t.string   "password"
    t.boolean  "enable"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "salt"
  end

end
