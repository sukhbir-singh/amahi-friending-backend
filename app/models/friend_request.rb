require 'securerandom'
class FriendRequest < ApplicationRecord
  belongs_to :amahi_user
  belongs_to :system

  def self.get_requests(system_id)
    requests = FriendRequest.where(system_id: system_id)
    new_requests = []
    requests.each do |request|
      new_requests << request.as_json.merge({
        email: request.amahi_user.email,
        status_txt: self.status_mapper(request.status)
      })
    end
    return new_requests
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
    self.status = 0
    UserMailer.invite_mail(self.amahi_user.email, self).deliver
    self.save
  end

  def self.status_mapper(status_code)
    # status: active (0), expired (1), accepted (2), rejected (3)
    case status_code
      when 1
        "Expired"
      when 2
        "Accepted"
      when 3
        "Rejected"
      else
        "Active"
    end
  end

  def self.accept_request(token, type)
    request = FriendRequest.where({invite_token: token}).first
    return "Friend request do not exist." if request.blank?
    return "Link expired." if (request.created_at != request.updated_at) || (Time.now().to_date - request.created_at.to_date).to_i >=2

    if type == "1" # accept invite
      user = FriendUser.new({amahi_user_id: request.amahi_user.id, system_id: request.system.id})

      if user.save
        request.status = 2 # status update for acceptance
        request.save
        return "Friend request acceptance successful."
      else
        return "Some error occurred."
      end
    else
      request.status = 3 # status update for rejection
      request.save
      return "Friend request rejection successful."
    end
  end

end
