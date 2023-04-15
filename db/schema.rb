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

ActiveRecord::Schema[7.0].define(version: 2023_04_15_051906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "street", null: false
    t.string "city", null: false
    t.string "postcode", null: false
    t.string "opening_hours"
    t.hstore "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_products", force: :cascade do |t|
    t.string "name"
    t.float "price1"
    t.float "price2"
    t.float "price3"
    t.string "order_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.hstore "name", null: false
    t.hstore "description"
    t.float "price", null: false
    t.string "product_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "email_confirmation_token"
    t.string "password_digest", null: false
    t.string "password_reset_token"
    t.string "phone"
    t.string "role", default: "customer", null: false
    t.string "street"
    t.string "city"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
