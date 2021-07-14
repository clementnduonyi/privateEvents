class Attendance < ApplicationRecord
    enum status: { invite_sent: 0, attending: 1 }

    belongs_to :attendee, class_name: "User"
    belongs_to :event
end
