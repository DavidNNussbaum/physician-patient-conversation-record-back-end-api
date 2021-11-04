class ChangeConversationDateTime < ActiveRecord::Migration[6.1]
  def change
    change_column :conversations, :date_time, :string, null: false
  end
end
