class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :theme
      t.string :venue
      t.text :details
      t.date :event_start_date
      t.date :event_end_date
      t.time :event_start_time
      t.time :event_end_time

      t.timestamps
    end
  end
end
