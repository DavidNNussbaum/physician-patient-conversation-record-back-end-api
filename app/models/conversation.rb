class Conversation < ApplicationRecord
    belongs_to :patient
    belongs_to :user 
    validates  :date_time, :details, :issue_resolved, presence: true
end




patient_id
user_id

