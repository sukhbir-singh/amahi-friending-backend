class AmahiUser < ApplicationRecord
    has_one :system
    has_many :friend_requests
    has_many :friend_users
end
