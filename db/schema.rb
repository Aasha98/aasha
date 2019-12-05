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

ActiveRecord::Schema.define(version: 2019_12_04_044125) do

  create_table "salaries", force: :cascade do |t|
    t.decimal "basic_pay"
    t.decimal "hra"
    t.decimal "cca"
    t.decimal "special_allowance"
    t.decimal "transport_allowance"
    t.decimal "reimbursement"
    t.decimal "income_tax"
    t.decimal "professional_tax"
    t.decimal "loss_of_pay"
    t.decimal "other_deductions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.integer "age"
    t.date "doj"
    t.string "contact"
    t.decimal "sal"
    t.decimal "salpm"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.string "blood"
    t.string "ename"
    t.string "econtact"
    t.string "pskill"
    t.string "sskill1"
    t.string "sskill2"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
  end

end
