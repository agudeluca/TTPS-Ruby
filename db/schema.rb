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

ActiveRecord::Schema.define(version: 20151215222900) do

  create_table "contacts", force: :cascade do |t|
    t.string   "type_contact"
    t.string   "contact_value"
    t.integer  "customer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "contacts", ["customer_id"], name: "index_contacts_on_customer_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "genre"
    t.integer  "document_number"
    t.string   "cuil_cuit"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "details"
    t.float    "amount"
    t.date     "date"
    t.string   "reveiver"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id"

end
