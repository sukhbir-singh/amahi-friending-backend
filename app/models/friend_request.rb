class FriendRequest < ApplicationRecord
  field :request_id, type: Integer
  field :status, type: Integer
  field :created_at, type: Timestamp
  field :email, type: String
  field :pin, type: String
  field :invite_token, type: String
  field :api_key, type: String
  field :last_requested_at, type: Timestamp

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validate :validate_email

  def validate_email
    unless self.email =~ EMAIL_REGEX
      self.errors.add(:base, "Email format is invalid")
    end
  end

end
