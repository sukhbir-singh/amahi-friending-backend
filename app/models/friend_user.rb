class FriendUser < ApplicationRecord
  field :id, type: Integer
  field :api_key, type: String
  field :email, type: String
  field :created_at, type: Timestamp

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validate :validate_email

  def validate_email
    unless self.email =~ EMAIL_REGEX
      self.errors.add(:base, "Email format is invalid")
    end
  end

end
