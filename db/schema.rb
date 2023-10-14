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

ActiveRecord::Schema[7.0].define(version: 2023_10_14_152726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at"
  end

  create_table "purchase_categories", force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "group_id", null: false
    t.index ["entity_id"], name: "index_purchase_categories_on_entity_id"
    t.index ["group_id"], name: "index_purchase_categories_on_group_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "author_id"
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
  end

  add_foreign_key "purchase_categories", "categories", column: "group_id"
  add_foreign_key "purchase_categories", "purchases", column: "entity_id"
end
