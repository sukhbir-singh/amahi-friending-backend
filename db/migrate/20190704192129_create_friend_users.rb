class CreateFriendUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_users do |t|
      t.integer :user_id
      t.string :api_key
      t.string :email
      t.datetime :created_at
    end
  end
end
