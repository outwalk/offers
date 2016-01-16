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

ActiveRecord::Schema.define(version: 20150926191421) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "agencies", force: :cascade do |t|
    t.integer  "user_id",                    limit: 4,                                              null: false
    t.string   "slug",                       limit: 255,                                            null: false
    t.string   "name",                       limit: 255,                                            null: false
    t.string   "full_name",                  limit: 255,                                            null: false
    t.text     "summary",                    limit: 65535
    t.text     "description",                limit: 65535
    t.string   "logo",                       limit: 255
    t.integer  "region_id",                  limit: 4,                                              null: false
    t.integer  "district_id",                limit: 4,                                              null: false
    t.string   "address",                    limit: 255
    t.string   "phone_first",                limit: 255,                                            null: false
    t.string   "phone_second",               limit: 255
    t.string   "phone_third",                limit: 255
    t.string   "phone_fourth",               limit: 255
    t.string   "email",                      limit: 255
    t.string   "site",                       limit: 255
    t.decimal  "latitude",                                 precision: 12, scale: 8
    t.decimal  "longitude",                                precision: 12, scale: 8
    t.boolean  "visible",                                                           default: false, null: false
    t.integer  "rank",                       limit: 4,                              default: 0,     null: false
    t.boolean  "import_enabled",                                                    default: false, null: false
    t.string   "import_type",                limit: 255
    t.string   "import_url",                 limit: 255
    t.integer  "offers_count",               limit: 4,                              default: 0,     null: false
    t.boolean  "twitter_enabled",                                                   default: false, null: false
    t.string   "twitter_email",              limit: 255
    t.string   "twitter_password",           limit: 255
    t.string   "twitter_username",           limit: 255
    t.string   "twitter_consumer_key",       limit: 255
    t.string   "twitter_consumer_secret",    limit: 255
    t.string   "twitter_oauth_token",        limit: 255
    t.string   "twitter_oauth_token_secret", limit: 255
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
  end

  add_index "agencies", ["name"], name: "index_agencies_on_name", using: :btree
  add_index "agencies", ["phone_first"], name: "index_agencies_on_phone_first", unique: true, using: :btree
  add_index "agencies", ["slug"], name: "index_agencies_on_slug", using: :btree
  add_index "agencies", ["user_id"], name: "index_agencies_on_user_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "slug",              limit: 255,   null: false
    t.string   "language",          limit: 255,   null: false
    t.string   "source",            limit: 255
    t.string   "source_url",        limit: 255
    t.string   "category",          limit: 255,   null: false
    t.string   "section",           limit: 255
    t.string   "title",             limit: 255,   null: false
    t.text     "description",       limit: 65535, null: false
    t.text     "images",            limit: 65535, null: false
    t.text     "intro",             limit: 65535, null: false
    t.text     "body",              limit: 65535, null: false
    t.string   "author",            limit: 255
    t.date     "written_on",                      null: false
    t.integer  "origin_id",         limit: 4
    t.integer  "uk_translation_id", limit: 4
    t.integer  "ru_translation_id", limit: 4
    t.integer  "en_translation_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "articles", ["body"], name: "index_articles_on_body", type: :fulltext
  add_index "articles", ["category"], name: "index_articles_on_category", using: :btree
  add_index "articles", ["en_translation_id"], name: "index_articles_on_en_translation_id", using: :btree
  add_index "articles", ["language"], name: "index_articles_on_language", using: :btree
  add_index "articles", ["origin_id"], name: "index_articles_on_origin_id", using: :btree
  add_index "articles", ["ru_translation_id"], name: "index_articles_on_ru_translation_id", using: :btree
  add_index "articles", ["section"], name: "index_articles_on_section", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree
  add_index "articles", ["source"], name: "index_articles_on_source", using: :btree
  add_index "articles", ["uk_translation_id"], name: "index_articles_on_uk_translation_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.integer  "region_id",        limit: 4,                                            null: false
    t.string   "slug",             limit: 255,                                          null: false
    t.string   "district_name_uk", limit: 255
    t.string   "name_uk",          limit: 255,                                          null: false
    t.string   "district_name_ru", limit: 255
    t.string   "name_ru",          limit: 255,                                          null: false
    t.string   "district_name_en", limit: 255
    t.string   "name_en",          limit: 255,                                          null: false
    t.string   "phone_code",       limit: 255
    t.boolean  "region_status",                                         default: false, null: false
    t.decimal  "latitude",                     precision: 12, scale: 8
    t.decimal  "longitude",                    precision: 12, scale: 8
    t.integer  "offers_count",     limit: 4,                            default: 0,     null: false
    t.integer  "mk_district_id",   limit: 4
    t.boolean  "has_metro",                                             default: false, null: false
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "districts", ["district_name_en"], name: "index_districts_on_district_name_en", using: :btree
  add_index "districts", ["district_name_ru"], name: "index_districts_on_district_name_ru", using: :btree
  add_index "districts", ["district_name_uk"], name: "index_districts_on_district_name_uk", using: :btree
  add_index "districts", ["mk_district_id"], name: "index_districts_on_mk_district_id", using: :btree
  add_index "districts", ["name_en"], name: "index_districts_on_name_en", using: :btree
  add_index "districts", ["name_ru"], name: "index_districts_on_name_ru", using: :btree
  add_index "districts", ["name_uk"], name: "index_districts_on_name_uk", using: :btree
  add_index "districts", ["region_id"], name: "index_districts_on_region_id", using: :btree
  add_index "districts", ["slug"], name: "index_districts_on_slug", using: :btree

  create_table "localities", force: :cascade do |t|
    t.integer  "region_id",    limit: 4,                                            null: false
    t.integer  "district_id",  limit: 4,                                            null: false
    t.string   "slug",         limit: 255,                                          null: false
    t.string   "category",     limit: 255,                                          null: false
    t.string   "name_uk",      limit: 255,                                          null: false
    t.string   "name_ru",      limit: 255,                                          null: false
    t.string   "name_en",      limit: 255,                                          null: false
    t.string   "phone_code",   limit: 255
    t.boolean  "non_admin",                                         default: false, null: false
    t.decimal  "latitude",                 precision: 12, scale: 8
    t.decimal  "longitude",                precision: 12, scale: 8
    t.integer  "offers_count", limit: 4,                            default: 0,     null: false
    t.integer  "mk_settle_id", limit: 4
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  add_index "localities", ["district_id"], name: "index_localities_on_district_id", using: :btree
  add_index "localities", ["mk_settle_id"], name: "index_localities_on_mk_settle_id", using: :btree
  add_index "localities", ["name_en"], name: "index_localities_on_name_en", using: :btree
  add_index "localities", ["name_ru"], name: "index_localities_on_name_ru", using: :btree
  add_index "localities", ["name_uk"], name: "index_localities_on_name_uk", using: :btree
  add_index "localities", ["region_id"], name: "index_localities_on_region_id", using: :btree
  add_index "localities", ["slug"], name: "index_localities_on_slug", using: :btree

  create_table "metro_stations", force: :cascade do |t|
    t.integer  "district_id", limit: 4,   null: false
    t.string   "name_uk",     limit: 255, null: false
    t.string   "name_en",     limit: 255, null: false
    t.string   "name_ru",     limit: 255, null: false
    t.string   "color",       limit: 255, null: false
    t.integer  "sequence",    limit: 4,   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "metro_stations", ["district_id"], name: "index_metro_stations_on_district_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4,                                                      null: false
    t.string   "code",                    limit: 255,                                                    null: false
    t.string   "offer_type",              limit: 255,                                                    null: false
    t.string   "property_type",           limit: 255,                            default: "residential", null: false
    t.string   "category",                limit: 255,                                                    null: false
    t.boolean  "new_flat",                                                       default: false,         null: false
    t.integer  "region_id",               limit: 4,                                                      null: false
    t.integer  "district_id",             limit: 4,                                                      null: false
    t.integer  "locality_id",             limit: 4
    t.string   "address",                 limit: 255
    t.string   "direction",               limit: 255
    t.float    "distance",                limit: 24
    t.decimal  "lat",                                   precision: 10, scale: 6
    t.decimal  "lng",                                   precision: 10, scale: 6
    t.boolean  "latlng_added_manually",                                          default: false,         null: false
    t.integer  "metro_station_id",        limit: 4
    t.float    "metro_time_on_transport", limit: 24
    t.float    "metro_time_on_foot",      limit: 24
    t.string   "railway_station",         limit: 255
    t.text     "images_list",             limit: 65535
    t.integer  "rooms",                   limit: 4
    t.integer  "rooms_offered",           limit: 4
    t.float    "area",                    limit: 24
    t.float    "living_space",            limit: 24
    t.text     "rooms_spaces",            limit: 65535
    t.float    "kitchen_space",           limit: 24
    t.float    "lot_area",                limit: 24
    t.string   "lot_type",                limit: 255
    t.string   "area_unit",               limit: 255
    t.integer  "floor",                   limit: 4
    t.integer  "floors_total",            limit: 4
    t.string   "title_uk",                limit: 255
    t.string   "title_ru",                limit: 255
    t.string   "title_en",                limit: 255
    t.text     "description",             limit: 65535
    t.text     "description_uk",          limit: 65535
    t.text     "description_ru",          limit: 65535
    t.text     "description_en",          limit: 65535
    t.string   "renovation",              limit: 255
    t.string   "quality",                 limit: 255
    t.boolean  "open_plan"
    t.string   "rooms_type",              limit: 255
    t.boolean  "phone"
    t.boolean  "internet"
    t.boolean  "room_furniture"
    t.boolean  "kitchen_furniture"
    t.boolean  "television"
    t.boolean  "washing_machine"
    t.boolean  "refrigerator"
    t.string   "balcony",                 limit: 255
    t.string   "bathroom_unit",           limit: 255
    t.string   "floor_covering",          limit: 255
    t.string   "window_view",             limit: 255
    t.string   "building_name",           limit: 255
    t.string   "building_type",           limit: 255
    t.string   "building_series",         limit: 255
    t.string   "building_phase",          limit: 255
    t.string   "building_section",        limit: 255
    t.string   "building_state",          limit: 255
    t.integer  "built_year",              limit: 4
    t.integer  "ready_quarter",           limit: 4
    t.boolean  "lift"
    t.boolean  "rubbish_chute"
    t.boolean  "is_elite"
    t.boolean  "parking"
    t.boolean  "alarm"
    t.float    "ceiling_height",          limit: 24
    t.boolean  "pmg"
    t.string   "toilet",                  limit: 255
    t.string   "shower",                  limit: 255
    t.boolean  "kitchen"
    t.boolean  "pool"
    t.boolean  "billiard"
    t.boolean  "sauna"
    t.boolean  "heating_supply"
    t.boolean  "water_supply"
    t.boolean  "sewerage_supply"
    t.boolean  "electricity_supply"
    t.boolean  "gas_supply"
    t.float    "price",                   limit: 24,                                                     null: false
    t.string   "price_currency",          limit: 255,                                                    null: false
    t.string   "price_unit",              limit: 255
    t.string   "price_period",            limit: 255
    t.float    "price_m2",                limit: 24
    t.float    "price_dollars",           limit: 24
    t.float    "price_m2_dollars",        limit: 24
    t.boolean  "not_for_agents"
    t.boolean  "haggle"
    t.boolean  "mortgage"
    t.float    "prepayment",              limit: 24
    t.boolean  "rent_pledge"
    t.boolean  "from_owner",                                                     default: false,         null: false
    t.float    "agent_fee",               limit: 24
    t.boolean  "no_agent_fee"
    t.string   "deal_status",             limit: 255
    t.boolean  "with_pets"
    t.boolean  "with_children"
    t.boolean  "manually_added",                                                 default: true,          null: false
    t.datetime "expires_at"
    t.boolean  "urgent",                                                         default: false,         null: false
    t.string   "phone_first",             limit: 255,                                                    null: false
    t.string   "phone_second",            limit: 255
    t.string   "phone_third",             limit: 255
    t.string   "phone_fourth",            limit: 255
    t.string   "user_name",               limit: 255
    t.string   "user_email",              limit: 255
    t.boolean  "active",                                                         default: true,          null: false
    t.boolean  "imported",                                                       default: false,         null: false
    t.datetime "created_at",                                                                             null: false
    t.datetime "updated_at",                                                                             null: false
  end

  add_index "offers", ["category"], name: "index_offers_on_category", using: :btree
  add_index "offers", ["district_id"], name: "index_offers_on_district_id", using: :btree
  add_index "offers", ["locality_id"], name: "index_offers_on_locality_id", using: :btree
  add_index "offers", ["offer_type"], name: "index_offers_on_offer_type", using: :btree
  add_index "offers", ["price"], name: "index_offers_on_price", using: :btree
  add_index "offers", ["region_id"], name: "index_offers_on_region_id", using: :btree
  add_index "offers", ["rooms"], name: "index_offers_on_rooms", using: :btree
  add_index "offers", ["updated_at"], name: "index_offers_on_updated_at", using: :btree
  add_index "offers", ["user_id", "code"], name: "index_offers_on_user_id_and_code", unique: true, using: :btree
  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "slug",         limit: 255,                                      null: false
    t.string   "name_uk",      limit: 255,                                      null: false
    t.string   "name_ru",      limit: 255,                                      null: false
    t.string   "name_en",      limit: 255,                                      null: false
    t.decimal  "latitude",                 precision: 12, scale: 8
    t.decimal  "longitude",                precision: 12, scale: 8
    t.integer  "offers_count", limit: 4,                            default: 0
    t.integer  "mk_region_id", limit: 4
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "regions", ["mk_region_id"], name: "index_regions_on_mk_region_id", using: :btree
  add_index "regions", ["name_en"], name: "index_regions_on_name_en", using: :btree
  add_index "regions", ["name_ru"], name: "index_regions_on_name_ru", using: :btree
  add_index "regions", ["name_uk"], name: "index_regions_on_name_uk", using: :btree
  add_index "regions", ["slug"], name: "index_regions_on_slug", using: :btree

  create_table "support", force: :cascade do |t|
    t.string   "language",    limit: 255,   null: false
    t.string   "slug",        limit: 255,   null: false
    t.string   "title",       limit: 255,   null: false
    t.text     "description", limit: 65535
    t.text     "body",        limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "support", ["body"], name: "index_support_on_body", type: :fulltext
  add_index "support", ["language", "slug"], name: "index_support_on_language_and_slug", unique: true, using: :btree
  add_index "support", ["language"], name: "index_support_on_language", using: :btree
  add_index "support", ["slug"], name: "index_support_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,                 null: false
    t.string   "encrypted_password",     limit: 255,                 null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "authentication_token",   limit: 255
    t.string   "name",                   limit: 255
    t.string   "phone_first",            limit: 255,                 null: false
    t.string   "phone_second",           limit: 255
    t.string   "phone_third",            limit: 255
    t.string   "phone_fourth",           limit: 255
    t.string   "slogan",                 limit: 255
    t.integer  "agency_id",              limit: 4
    t.integer  "region_id",              limit: 4
    t.integer  "district_id",            limit: 4
    t.integer  "locality_id",            limit: 4
    t.boolean  "terms_of_service",                   default: false, null: false
    t.boolean  "subscribed",                         default: false, null: false
    t.string   "language",               limit: 4
    t.integer  "offers_count",           limit: 4,   default: 0,     null: false
    t.boolean  "admin",                              default: false, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["admin"], name: "index_users_on_admin", using: :btree
  add_index "users", ["agency_id"], name: "index_users_on_agency_id", using: :btree
  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone_first"], name: "index_users_on_phone_first", unique: true, using: :btree
  add_index "users", ["phone_fourth"], name: "index_users_on_phone_fourth", using: :btree
  add_index "users", ["phone_second"], name: "index_users_on_phone_second", using: :btree
  add_index "users", ["phone_third"], name: "index_users_on_phone_third", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
