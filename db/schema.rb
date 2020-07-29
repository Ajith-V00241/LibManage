# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_26_124317) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author", null: false
    t.string "publisher", null: false
    t.string "language", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "totalBooks", default: 0
    t.integer "availableBooks", default: 0
    t.string "image", default: "/assets/bookLogo.jpg"
  end

  create_table "lended_books", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.datetime "date_of_lend"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "book_id", null: false
    t.string "status"
    t.index ["book_id"], name: "index_lended_books_on_book_id"
    t.index ["user_id"], name: "index_lended_books_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "status", default: "pending", null: false
    t.string "request_type", null: false
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lended_book_id"
    t.index ["book_id"], name: "index_requests_on_book_id"
    t.index ["lended_book_id"], name: "index_requests_on_lended_book_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.datetime "date_of_membership"
    t.integer "totalcheckout", default: 0
    t.text "address"
    t.string "role", default: "member", null: false
    t.string "phone", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lended_books", "books"
  add_foreign_key "requests", "lended_books"
end
