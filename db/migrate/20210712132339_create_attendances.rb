class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id
      t.integer :event_id
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
