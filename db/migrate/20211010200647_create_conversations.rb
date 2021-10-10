class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.datetime :date_time, null: false
      t.text :details, null: false
      t.boolean :issue_resolved, null: false
      t.integer :patient_id
      t.integer :user_id

      t.timestamps
    end
  end
end
