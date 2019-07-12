class CreateFriendUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_users do |t|
      t.belongs_to :amahi_user, index: true
      t.belongs_to :system, index: true

      t.timestamps
    end
  end
end
