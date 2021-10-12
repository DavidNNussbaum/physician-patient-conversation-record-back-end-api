class PatientSerializer
    include JSONAPI::Serializer
    attributes :initials, :dob, :id 
     
    def conversations
      self.object.conversations.map do |c|
        {
          date_time: c.date_time,
          details: c.details,
          issue_resolved: c.issue_resolved,
          patient_id: c.patient_id,
          user_id: c.user_id,
          id: c.id
        }
      end
    end
  end
   
  
  