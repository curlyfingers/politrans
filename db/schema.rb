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

ActiveRecord::Schema.define(version: 2019_11_05_063130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_sections", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.integer "order"
    t.boolean "visible", default: false, null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_link"
    t.text "contents"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_news_on_slug", unique: true
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order"
    t.boolean "visible", default: false, null: false
    t.string "icon_link"
    t.string "image_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_product_categories_on_slug", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order", null: false
    t.boolean "visible", default: false, null: false
    t.string "image_link"
    t.string "icon_link"
    t.bigint "product_category_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["slug", "product_category_id"], name: "index_products_on_slug_and_product_category_id", unique: true
  end

  create_table "promotions", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "visible", default: false, null: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.text "description", null: false
    t.string "image_link"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_promotions_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
