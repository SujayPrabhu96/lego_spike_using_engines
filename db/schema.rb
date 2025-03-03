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

ActiveRecord::Schema[7.1].define(version: 2024_07_29_095625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders_purchase_order_warehouses", force: :cascade do |t|
    t.bigint "warehouse_id", null: false
    t.bigint "purchase_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_order_id"], name: "index_orders_purchase_order_warehouses_on_purchase_order_id"
    t.index ["warehouse_id"], name: "index_orders_purchase_order_warehouses_on_warehouse_id"
  end

  create_table "orders_purchase_orders", force: :cascade do |t|
    t.string "order_number"
    t.string "external_order_id"
    t.string "order_type"
    t.string "status"
    t.string "business_unit"
    t.date "order_date"
    t.date "receipt_date"
    t.integer "estimated_lpn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders_purchase_order_warehouses", "orders_purchase_orders", column: "purchase_order_id"
  add_foreign_key "orders_purchase_order_warehouses", "warehouses"
end
