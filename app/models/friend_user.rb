class FriendUser < ApplicationRecord
  belongs_to :amahi_user
  belongs_to :system

  def self.get_users(system_id)
    users = FriendUser.where(system_id: system_id)
    new_users = []
    users.each do |user|
      new_users << user.as_json.merge({
        email: user.amahi_user.email
      })
    end
    return new_users
  end

  def self.create(args)
    user = FriendUser.new(args)
    # Also set api_key
    return user
  end
end
