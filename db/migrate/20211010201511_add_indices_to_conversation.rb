class AddIndicesToConversation < ActiveRecord::Migration[6.1]
  def change
    add_index :conversations, :patient_id
    add_index :conversations, :user_id
  end
end
