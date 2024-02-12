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

ActiveRecord::Schema[7.0].define(version: 2024_02_12_181758) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "municipe_addresses", force: :cascade do |t|
    t.string "street"
    t.string "street_number"
    t.string "neighborhood"
    t.string "address_complement"
    t.string "cep"
    t.string "city"
    t.string "state"
    t.string "ibge_code"
    t.bigint "municipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipe_id"], name: "index_municipe_addresses_on_municipe_id"
  end

  create_table "municipes", force: :cascade do |t|
    t.string "full_name"
    t.string "cpf"
    t.string "cns"
    t.string "email"
    t.string "telephone"
    t.date "birth_date"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "ddi"
  end

end
