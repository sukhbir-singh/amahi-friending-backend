class FriendUser < ApplicationRecord
  validate :validate_email

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def validate_email
    unless self.email =~ EMAIL_REGEX
      self.errors.add(:base, "Email format is invalid")
    end
  end

end
