class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :status, default: 1
      t.datetime :created_at, null: false
      t.string :email, null: false
      t.string :pin
      t.string :invite_token
      t.string :api_key
      t.datetime :last_requested_at
    end
  end
end
