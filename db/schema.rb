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

ActiveRecord::Schema.define(version: 2019_07_12_170705) do

  create_table "amahi_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend_requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "amahi_user_id"
    t.bigint "system_id"
    t.integer "status", default: 1
    t.string "pin"
    t.string "invite_token"
    t.datetime "last_requested_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amahi_user_id"], name: "index_friend_requests_on_amahi_user_id"
    t.index ["system_id"], name: "index_friend_requests_on_system_id"
  end

  create_table "friend_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "amahi_user_id"
    t.bigint "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amahi_user_id"], name: "index_friend_users_on_amahi_user_id"
    t.index ["system_id"], name: "index_friend_users_on_system_id"
  end

  create_table "systems", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "amahi_user_id"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amahi_user_id"], name: "index_systems_on_amahi_user_id"
  end

end
