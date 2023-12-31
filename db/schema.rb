# frozen_string_literal: true

ActiveRecord::Schema[7.0].define(version: 20_230_729_111_149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'broadcasts', force: :cascade do |t|
    t.string 'heading'
    t.string 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'business_products', force: :cascade do |t|
    t.string 'name'
    t.string 'brand'
    t.decimal 'price', precision: 10, scale: 2
    t.bigint 'business_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'business_name'
    t.index ['business_id'], name: 'index_business_products_on_business_id'
  end

  create_table 'businesses', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.bigint 'contact_number'
    t.string 'address'
    t.string 'image'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'owner_username'
    t.index ['user_id'], name: 'index_businesses_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'comment'
    t.bigint 'user_id', null: false
    t.bigint 'event_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_comments_on_event_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'event_name'
    t.text 'caption'
    t.string 'image'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.text 'images', default: '[]'
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'homes', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'local_authorities', force: :cascade do |t|
    t.string 'department'
    t.string 'name'
    t.bigint 'contact_number'
    t.string 'address'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'messages', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'room_id', null: false
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_messages_on_room_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.text 'customer_order'
    t.bigint 'user_id', null: false
    t.bigint 'business_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'business_name'
    t.index ['business_id'], name: 'index_orders_on_business_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'participants', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'room_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_participants_on_room_id'
    t.index ['user_id'], name: 'index_participants_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'review_body'
    t.bigint 'user_id', null: false
    t.bigint 'business_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['business_id'], name: 'index_reviews_on_business_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'rooms', force: :cascade do |t|
    t.string 'name'
    t.boolean 'is_private'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'suggestions', force: :cascade do |t|
    t.string 'suggestion_body'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_suggestions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'username'
    t.bigint 'room_id'
    t.integer 'role'
    t.bigint 'contact_no'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['room_id'], name: 'index_users_on_room_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'business_products', 'businesses'
  add_foreign_key 'businesses', 'users'
  add_foreign_key 'comments', 'events'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'events', 'users'
  add_foreign_key 'messages', 'rooms'
  add_foreign_key 'messages', 'users'
  add_foreign_key 'orders', 'businesses'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'participants', 'rooms'
  add_foreign_key 'participants', 'users'
  add_foreign_key 'reviews', 'businesses'
  add_foreign_key 'reviews', 'users'
  add_foreign_key 'suggestions', 'users'
  add_foreign_key 'users', 'rooms'
end
