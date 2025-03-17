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

ActiveRecord::Schema[7.1].define(version: 2025_03_14_134724) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chat_members", force: :cascade do |t|
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "connected_at", default: "2025-03-13 16:55:57"
    t.index ["chatroom_id"], name: "index_chat_members_on_chatroom_id"
    t.index ["user_id"], name: "index_chat_members_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "coproperty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["coproperty_id"], name: "index_chatrooms_on_coproperty_id"
  end

  create_table "coproperties", force: :cascade do |t|
    t.string "name"
    t.integer "total_surface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decisions", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "meeting_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
    t.string "title"
    t.index ["meeting_id"], name: "index_decisions_on_meeting_id"
    t.index ["user_id"], name: "index_decisions_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "like"
    t.string "name"
    t.string "tag"
    t.bigint "user_id", null: false
    t.bigint "coproperty_id", null: false
    t.string "documentable_type"
    t.bigint "documentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coproperty_id"], name: "index_documents_on_coproperty_id"
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "link"
    t.bigint "user_id", null: false
    t.text "description"
    t.bigint "coproperty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coproperty_id"], name: "index_meetings_on_coproperty_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chatroom_id", null: false
    t.text "content"
    t.bigint "chat_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_member_id"], name: "index_messages_on_chat_member_id"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
  end

  create_table "solid_cable_messages", force: :cascade do |t|
    t.text "channel"
    t.text "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel"], name: "index_solid_cable_messages_on_channel"
    t.index ["created_at"], name: "index_solid_cable_messages_on_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name"
    t.string "first_name"
    t.boolean "status"
    t.bigint "coproperty_id"
    t.integer "square_meters"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coproperty_id"], name: "index_users_on_coproperty_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "decision_id", null: false
    t.bigint "user_id", null: false
    t.boolean "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decision_id"], name: "index_votes_on_decision_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chat_members", "chatrooms"
  add_foreign_key "chat_members", "users"
  add_foreign_key "chatrooms", "coproperties"
  add_foreign_key "decisions", "meetings"
  add_foreign_key "decisions", "users"
  add_foreign_key "documents", "coproperties"
  add_foreign_key "documents", "users"
  add_foreign_key "meetings", "coproperties"
  add_foreign_key "meetings", "users"
  add_foreign_key "messages", "chat_members"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "votes", "decisions"
  add_foreign_key "votes", "users"
end
