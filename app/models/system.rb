class System < ApplicationRecord
    belongs_to :amahi_user
    has_many :friend_requests
    has_many :friend_users
end
