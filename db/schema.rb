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

ActiveRecord::Schema.define(version: 2019_06_11_146100) do

  create_table "customer_institutions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "institution_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_institutions_on_customer_id"
    t.index ["institution_id"], name: "index_customer_institutions_on_institution_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana", null: false
    t.integer "sex", null: false
    t.date "birthday"
    t.text "image"
    t.string "phone_number"
    t.string "cell_phone_number"
    t.string "emergency_phone_number"
    t.string "postal_code"
    t.bigint "prefecture_id"
    t.string "city"
    t.text "address"
    t.text "building"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kana"], name: "index_customers_on_kana"
    t.index ["name"], name: "index_customers_on_name"
    t.index ["prefecture_id"], name: "index_customers_on_prefecture_id"
  end

  create_table "institution_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana", null: false
    t.text "image"
    t.string "phone_number_one"
    t.string "phone_number_two"
    t.integer "postal_code"
    t.bigint "prefecture_id"
    t.string "city"
    t.text "address"
    t.text "building"
    t.bigint "institution_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_type_id"], name: "index_institutions_on_institution_type_id"
    t.index ["kana"], name: "index_institutions_on_kana"
    t.index ["name"], name: "index_institutions_on_name"
    t.index ["prefecture_id"], name: "index_institutions_on_prefecture_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", null: false
    t.string "ancestry"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_subjects_on_ancestry"
  end

  create_table "transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "ts_number", null: false
    t.date "date", null: false
    t.bigint "customer_id"
    t.bigint "subject_id"
    t.integer "amount", null: false
    t.bigint "institution_id"
    t.text "summary", limit: 255
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
    t.index ["institution_id"], name: "index_transactions_on_institution_id"
    t.index ["subject_id"], name: "index_transactions_on_subject_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "rese_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customer_institutions", "customers"
  add_foreign_key "customer_institutions", "institutions"
  add_foreign_key "customers", "prefectures"
  add_foreign_key "institutions", "institution_types"
  add_foreign_key "institutions", "prefectures"
  add_foreign_key "transactions", "customers"
  add_foreign_key "transactions", "institutions"
  add_foreign_key "transactions", "subjects"
  add_foreign_key "transactions", "users"
end
