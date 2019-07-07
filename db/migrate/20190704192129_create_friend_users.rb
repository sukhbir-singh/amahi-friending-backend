class CreateFriendUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_users do |t|
      t.string :api_key
      t.string :email, null: false
      t.datetime :created_at, null: false
    end
  end
end
