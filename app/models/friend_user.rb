class FriendUser < ApplicationRecord
  belongs_to :amahi_user
  belongs_to :system

  def self.create(args)
    user = FriendUser.new(args)
    # Also set api_key
    return user
  end
end
