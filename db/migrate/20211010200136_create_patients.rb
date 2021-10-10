class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :initials, null: false
      t.datetime :dob, null: false

      t.timestamps
    end
  end
end
