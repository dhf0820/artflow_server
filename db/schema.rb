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

ActiveRecord::Schema.define(version: 20170124062017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_requests", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "sales_rep_id"
    t.datetime "art_requested_date"
    t.datetime "shipment_date"
    t.integer  "product_id"
    t.time     "deleted_at"
    t.string   "product_request_class"
    t.integer  "artist_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["artist_id", "status"], name: "index_art_requests_on_artist_id_and_status", using: :btree
    t.index ["customer_id"], name: "index_art_requests_on_customer_id", using: :btree
    t.index ["deleted_at"], name: "index_art_requests_on_deleted_at", using: :btree
    t.index ["product_id"], name: "index_art_requests_on_product_id", using: :btree
    t.index ["sales_rep_id"], name: "index_art_requests_on_sales_rep_id", using: :btree
    t.index ["status"], name: "index_art_requests_on_status", using: :btree
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name", unique: true, using: :btree
    t.index ["short_name"], name: "index_artists_on_short_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_artists_on_user_id", unique: true, using: :btree
  end

  create_table "card_ace_types", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["deleted_at"], name: "index_card_ace_types_on_deleted_at", using: :btree
    t.index ["design_id", "name"], name: "index_card_ace_types_on_design_id_and_name", unique: true, using: :btree
  end

  create_table "card_art_requests", force: :cascade do |t|
    t.string  "name"
    t.integer "art_request_id"
    t.integer "design_id"
    t.integer "card_stock_id"
    t.integer "card_type_id"
    t.time    "deleted_at"
    t.index ["art_request_id"], name: "index_card_art_requests_on_art_request_id", using: :btree
  end

  create_table "card_back_specs", force: :cascade do |t|
    t.integer  "design_id"
    t.integer  "back_type_id"
    t.string   "back_art_id"
    t.integer  "card_set_id"
    t.integer  "art_set_id"
    t.string   "color"
    t.string   "tuck_color"
    t.integer  "plate_id"
    t.text     "comments"
    t.string   "photo_file_name"
    t.string   "art_folder"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "thumb_nail"
    t.time     "deleted_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "art_approved_by"
    t.datetime "art_approved_date"
    t.string   "compliance_approved_by"
    t.datetime "compliance_approved_date"
    t.string   "compliance_approval"
    t.index ["back_art_id"], name: "index_card_back_specs_on_back_art_id", using: :btree
    t.index ["card_set_id"], name: "index_card_back_specs_on_card_set_id", using: :btree
    t.index ["deleted_at"], name: "index_card_back_specs_on_deleted_at", using: :btree
    t.index ["plate_id"], name: "index_card_back_specs_on_plate_id", using: :btree
  end

  create_table "card_back_types", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "name"
    t.string   "bleed"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_thumbnail"
    t.time     "deleted_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["deleted_at"], name: "index_card_back_types_on_deleted_at", using: :btree
    t.index ["design_id", "name"], name: "index_card_back_types_on_design_id_and_name", unique: true, using: :btree
  end

  create_table "card_background_colors", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "color"
    t.string   "tuck_color"
    t.time     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_card_background_colors_on_deleted_at", using: :btree
    t.index ["design_id", "color"], name: "index_card_background_colors_on_design_id_and_color", unique: true, using: :btree
  end

  create_table "card_background_edges", force: :cascade do |t|
    t.integer  "background_id"
    t.integer  "edge_id"
    t.time     "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["background_id", "edge_id"], name: "index_card_background_edges_on_background_id_and_edge_id", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_card_background_edges_on_deleted_at", using: :btree
  end

  create_table "card_design_types", force: :cascade do |t|
    t.string   "name"
    t.time     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_card_design_types_on_deleted_at", using: :btree
    t.index ["name"], name: "index_card_design_types_on_name", unique: true, using: :btree
  end

  create_table "card_edge_types", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "name"
    t.string   "desc"
    t.time     "deleted_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["deleted_at"], name: "index_card_edge_types_on_deleted_at", using: :btree
    t.index ["design_id", "name"], name: "index_card_edge_types_on_design_id_and_name", unique: true, using: :btree
  end

  create_table "card_face_colors", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "color"
    t.string   "description"
    t.time     "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["deleted_at"], name: "index_card_face_colors_on_deleted_at", using: :btree
    t.index ["design_id", "color"], name: "index_card_face_colors_on_design_id_and_color", unique: true, using: :btree
  end

  create_table "card_face_specs", force: :cascade do |t|
    t.integer  "design_id"
    t.integer  "face_type_id"
    t.integer  "card_set_id"
    t.string   "face_art_id"
    t.integer  "art_set_id"
    t.string   "color"
    t.integer  "ace_id"
    t.integer  "joker_id"
    t.integer  "card_stock_id"
    t.integer  "plate_id"
    t.text     "comments"
    t.string   "art_folder"
    t.string   "art_file_name"
    t.string   "art_content_type"
    t.integer  "art_file_size"
    t.datetime "art_updated_at"
    t.string   "thumb_nail"
    t.time     "deleted_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "art_approved_by"
    t.datetime "art_approved_date"
    t.string   "compliance_approved_by"
    t.datetime "compliance_approved_date"
    t.string   "compliance_approval"
    t.index ["card_set_id"], name: "index_card_face_specs_on_card_set_id", using: :btree
    t.index ["deleted_at"], name: "index_card_face_specs_on_deleted_at", using: :btree
    t.index ["face_art_id"], name: "index_card_face_specs_on_face_art_id", using: :btree
    t.index ["plate_id"], name: "index_card_face_specs_on_plate_id", using: :btree
  end

  create_table "card_face_type_codes", force: :cascade do |t|
    t.string   "code"
    t.string   "desc"
    t.string   "number"
    t.time     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_card_face_type_codes_on_code", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_card_face_type_codes_on_deleted_at", using: :btree
  end

  create_table "card_face_types", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "name"
    t.string   "code"
    t.string   "sample_content_type"
    t.integer  "sample_file_size"
    t.datetime "sample_updated_at"
    t.string   "sample_thumb_nail"
    t.time     "deleted_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["deleted_at"], name: "index_card_face_types_on_deleted_at", using: :btree
    t.index ["design_id", "name"], name: "index_card_face_types_on_design_id_and_name", unique: true, using: :btree
  end

  create_table "card_item_numbers", force: :cascade do |t|
    t.string   "item_number"
    t.string   "desc"
    t.string   "product_line"
    t.string   "base"
    t.time     "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["deleted_at"], name: "index_card_item_numbers_on_deleted_at", using: :btree
    t.index ["item_number"], name: "index_card_item_numbers_on_item_number", unique: true, using: :btree
    t.index ["product_line"], name: "index_card_item_numbers_on_product_line", using: :btree
  end

  create_table "card_joker_types", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["deleted_at"], name: "index_card_joker_types_on_deleted_at", using: :btree
    t.index ["design_id", "name"], name: "index_card_joker_types_on_design_id_and_name", unique: true, using: :btree
  end

  create_table "card_package_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.boolean  "preshuffle"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_card_package_types_on_deleted_at", using: :btree
    t.index ["name"], name: "index_card_package_types_on_name", unique: true, using: :btree
  end

  create_table "card_paper_types", force: :cascade do |t|
    t.string   "name"
    t.time     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_card_paper_types_on_deleted_at", using: :btree
    t.index ["name"], name: "index_card_paper_types_on_name", unique: true, using: :btree
  end

  create_table "card_product_line_codes", force: :cascade do |t|
    t.string   "code"
    t.string   "desc"
    t.string   "code_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_card_product_line_codes_on_code", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_card_product_line_codes_on_deleted_at", using: :btree
  end

  create_table "card_seal_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_card_seal_types_on_deleted_at", using: :btree
    t.index ["name"], name: "index_card_seal_types_on_name", unique: true, using: :btree
  end

  create_table "card_stock_types", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "number"
    t.time     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_card_stock_types_on_deleted_at", using: :btree
    t.index ["name"], name: "index_card_stock_types_on_name", unique: true, using: :btree
  end

  create_table "card_types", force: :cascade do |t|
    t.string   "name"
    t.time     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_card_types_on_deleted_at", using: :btree
    t.index ["name"], name: "index_card_types_on_name", unique: true, using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "c"
    t.string   "y"
    t.string   "m"
    t.string   "k"
    t.string   "pms_color"
    t.time     "deleted_at"
    t.boolean  "user_generated", default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["name"], name: "index_colors_on_name", unique: true, using: :btree
  end

  create_table "csrs", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_csrs_on_name", unique: true, using: :btree
    t.index ["short_name"], name: "index_csrs_on_short_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_csrs_on_user_id", unique: true, using: :btree
  end

  create_table "customer_card", force: :cascade do |t|
    t.integer "customer_id"
    t.string  "name"
    t.string  "part_number"
    t.integer "face_id"
    t.integer "back_id"
    t.integer "packaging_id"
    t.text    "production_notes"
    t.text    "shipping_notes"
    t.time    "deleted_at"
    t.index ["customer_id", "name"], name: "index_customer_card_on_customer_id_and_name", unique: true, using: :btree
    t.index ["customer_id", "part_number"], name: "index_customer_card_on_customer_id_and_part_number", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_customer_card_on_deleted_at", using: :btree
    t.index ["face_id"], name: "index_customer_card_on_face_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string  "sage_id"
    t.string  "name"
    t.string  "address1"
    t.string  "address2"
    t.string  "city"
    t.string  "state"
    t.string  "postal_code"
    t.string  "contact_name"
    t.string  "contact_email"
    t.string  "contact_phone"
    t.integer "sales_rep_id"
    t.time    "deleted_at"
    t.index ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree
    t.index ["name"], name: "index_customers_on_name", using: :btree
    t.index ["sage_id"], name: "index_customers_on_sage_id", unique: true, using: :btree
    t.index ["sales_rep_id"], name: "index_customers_on_sales_rep_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "product_request_class"
    t.time     "deleted_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
    t.index ["name"], name: "index_products_on_name", unique: true, using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "sales_reps", force: :cascade do |t|
    t.string  "name"
    t.string  "short_name"
    t.string  "phone"
    t.string  "email"
    t.integer "user_id"
    t.index ["name"], name: "index_sales_reps_on_name", using: :btree
    t.index ["short_name"], name: "index_sales_reps_on_short_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_sales_reps_on_user_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.time     "deleted_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

end
