class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :request_id
      t.integer :status
      t.datetime :created_at
      t.string :email
      t.string :pin
      t.string :invite_token
      t.string :api_key
      t.datetime :last_requested_at
    end
  end
end
