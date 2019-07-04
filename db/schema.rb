ActiveRecord::Schema.define(version: 2019_07_04_192342) do

  create_table "friend_requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "request_id"
    t.integer "status"
    t.datetime "created_at"
    t.string "email"
    t.string "pin"
    t.string "invite_token"
    t.string "api_key"
    t.datetime "last_requested_at"
  end

  create_table "friend_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "api_key"
    t.string "email"
    t.datetime "created_at"
  end

end
