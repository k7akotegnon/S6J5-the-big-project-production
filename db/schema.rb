# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_16_175910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "zip_code"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.bigint "gossip_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["gossip_id"], name: "index_comments_on_gossip_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "gossip_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "gossip_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "updated_at", null: false
    t.index ["gossip_id"], name: "index_gossip_tags_on_gossip_id"
    t.index ["tag_id"], name: "index_gossip_tags_on_tag_id"
  end

  create_table "gossips", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.datetime "created_at", null: false
    t.bigint "gossip_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["gossip_id"], name: "index_likes_on_gossip_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.bigint "recipient_id"
    t.bigint "sender_id"
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_private_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_private_messages_on_sender_id"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "comments", "gossips"
  add_foreign_key "comments", "users"
  add_foreign_key "gossip_tags", "gossips"
  add_foreign_key "gossip_tags", "tags"
  add_foreign_key "gossips", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "gossips"
  add_foreign_key "likes", "users"
  add_foreign_key "users", "cities"
end
