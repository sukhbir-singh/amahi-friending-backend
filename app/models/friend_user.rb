class FriendUser < ApplicationRecord
  belongs_to :amahi_user
  belongs_to :system

  def self.get_users(system_id)
    FriendUser.where(system_id: system_id)
  end

  def self.create(args)
    user = FriendUser.new(args)
    # Also set api_key
    return user
  end
end
