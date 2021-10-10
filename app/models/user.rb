class User < ApplicationRecord
    has_many :conversations
    has_many :patients, through: :conversations
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
