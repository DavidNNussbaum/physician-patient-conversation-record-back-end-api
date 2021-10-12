class Patient < ApplicationRecord
    has_many :conversations
    scope :order_by_initials, -> {order("lower(initials)")}
    validates :initials, :dob, presence: true
end
 

