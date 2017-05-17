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

ActiveRecord::Schema.define(version: 20170517191649) do

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_notifications_on_produto_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "payment_id", limit: 36
    t.integer  "user_id"
    t.         "products"
  end

  create_table "orders_produtos", force: :cascade do |t|
    t.integer "order_id"
    t.integer "produto_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.decimal  "valor",         precision: 12, scale: 3
    t.integer  "quantidade"
    t.text     "descricao"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image"
    t.integer  "department"
    t.integer  "department_id"
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "shopping_cart_id"
    t.decimal  "unit_price",       precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price",      precision: 12, scale: 3
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["produto_id"], name: "index_shopping_cart_items_on_produto_id"
    t.index ["shopping_cart_id"], name: "index_shopping_cart_items_on_shopping_cart_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
