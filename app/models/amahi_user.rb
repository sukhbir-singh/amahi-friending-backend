class AmahiUser < ApplicationRecord
    validate :validate_email
    validates :email, presence: true

    has_one :system
    has_many :friend_requests
    has_many :friend_users

    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    def validate_email
       unless self.email =~ EMAIL_REGEX
         self.errors.add(:base, "Email format is invalid")
       end
    end

end
