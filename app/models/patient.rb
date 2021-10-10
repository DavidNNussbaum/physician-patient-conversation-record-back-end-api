class Patient < ApplicationRecord
    has_many :conversations
    scope :order_by_date_time, -> {order("lower(date_time)")}
    validates :initials, :dob, presence: true
end
 

