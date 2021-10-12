class ConversationSerializer
    include JSONAPI::Serializer
    attributes :date_time, :details, :issue_resolved, :patient_id, :user_id, :id
  end

   
   