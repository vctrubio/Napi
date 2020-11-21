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

ActiveRecord::Schema.define(version: 2020_11_12_155106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bags", force: :cascade do |t|
    t.bigint "pickup_id", null: false
    t.integer "kg"
    t.integer "price"
    t.float "avgprice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["pickup_id"], name: "index_bags_on_pickup_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "flat"
    t.string "zone"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating"
    t.boolean "archive"
    t.index ["employee_id"], name: "index_clients_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.text "description"
    t.boolean "archive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "cash"
    t.float "paidcash"
  end

  create_table "fruits", force: :cascade do |t|
    t.string "name"
    t.float "priceA"
    t.float "priceB"
    t.float "priceC"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archive"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.text "description"
    t.integer "fields", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archive"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.date "date"
    t.string "time"
    t.float "price", default: 0.0
    t.float "kg", default: 0.0
    t.string "comment"
    t.boolean "paid"
    t.boolean "delivered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.string "name"
    t.boolean "ticket"
    t.bigint "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.index ["employee_id"], name: "index_payments_on_employee_id"
  end

  create_table "pickups", force: :cascade do |t|
    t.bigint "landlord_id"
    t.date "date"
    t.integer "kg"
    t.float "price"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["landlord_id"], name: "index_pickups_on_landlord_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.float "kg"
    t.bigint "fruit_id"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.index ["fruit_id"], name: "index_receipts_on_fruit_id"
    t.index ["order_id"], name: "index_receipts_on_order_id"
  end

  create_table "totals", force: :cascade do |t|
    t.bigint "payment_id"
    t.bigint "order_id"
    t.bigint "pickup_id"
    t.float "inflow"
    t.float "outflow"
    t.float "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_totals_on_order_id"
    t.index ["payment_id"], name: "index_totals_on_payment_id"
    t.index ["pickup_id"], name: "index_totals_on_pickup_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bags", "pickups"
  add_foreign_key "clients", "employees"
  add_foreign_key "orders", "clients"
  add_foreign_key "payments", "employees"
  add_foreign_key "pickups", "landlords"
  add_foreign_key "receipts", "fruits"
  add_foreign_key "receipts", "orders"
  add_foreign_key "totals", "orders"
  add_foreign_key "totals", "payments"
  add_foreign_key "totals", "pickups"
end
