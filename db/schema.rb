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

ActiveRecord::Schema.define(version: 20200315000815) do

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "part_number"
    t.decimal "purchase_price"
    t.decimal "sale_price"
    t.integer "qty"
    t.boolean "active", default: true
  end

  create_table "sales_order_products", force: :cascade do |t|
    t.integer "qty"
    t.decimal "sales_price"
    t.decimal "discount"
    t.integer "product_id"
    t.integer "sales_order_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_order_products_on_product_id"
    t.index ["sales_order_id"], name: "index_sales_order_products_on_sales_order_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.string "customer_name"
    t.integer "payment_method"
    t.integer "order_status", null: false, default: 1
    t.decimal "sub_total"
    t.decimal "tax_total"
    t.decimal "discount_total"
    t.decimal "total"
    t.date "bill_date"
    t.date "order_date"
    t.date "delivery_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_number"
    t.text "address"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
