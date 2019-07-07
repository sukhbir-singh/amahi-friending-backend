require 'securerandom'
class FriendRequest < ApplicationRecord
  validate :validate_email
  validates :email, presence: true
  validates :pin, presence: true

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def validate_email
    unless self.email =~ EMAIL_REGEX
      self.errors.add(:base, "Email format is invalid")
    end
  end

  def self.create(args)
    request = FriendRequest.new(args)
    request.status = 0
    request.last_requested_at = Time.now.to_s
    request.invite_token = SecureRandom.urlsafe_base64.to_s
    # Also set api_key
    return request
  end

  def resend_request
    self.last_requested_at = Time.now.to_s
    # send another email invite to user
    self.save
  end
end
