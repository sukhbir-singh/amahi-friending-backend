require 'securerandom'
class FriendRequest < ApplicationRecord
  belongs_to :amahi_user
  belongs_to :system

  def self.get_requests(user_id)
    FriendRequest.where(amahi_user_id: user_id)
  end

  def self.create(args)
    amahi_user = AmahiUser.where(email: args["email"]).first

    if amahi_user.blank?
      return "user does not exist", nil
    end

    request = FriendRequest.new()
    request.status = 0
    request.amahi_user_id = amahi_user.id
    request.pin = args["pin"]
    request.invite_token = SecureRandom.urlsafe_base64.to_s
    request.system_id = System.where(amahi_user_id: amahi_user.id).first.id rescue nil
    request.last_requested_at = Time.now.to_s
    return nil, request
  end

  def resend_request
    self.last_requested_at = Time.now.to_s
    # send another email invite to user
    self.save
  end
end
