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
    request.system_id = args["system_user"].id
    request.last_requested_at = Time.now.to_s
    return nil, request
  end

  def resend_request
    self.last_requested_at = Time.now.to_s
    UserMailer.invite_mail(self.amahi_user.email, self).deliver
    self.save
  end

  def self.accept_request(token)
    request = FriendRequest.where({invite_token: token}).first
    return "Friend request do not exist." if request.blank?

    user = FriendUser.new({amahi_user_id: request.amahi_user.id, system_id: request.system.id})
    if user.save
      request.status = 2 # status update for acceptance
      request.save
      return "Friend request acceptance successful."
    else
      return "Some error occurred."
    end
  end

end
