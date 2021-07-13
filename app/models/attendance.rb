class Attendance < ApplicationRecord
    enum status: [:invit, :attending, :no_respons]

    belongs_to :attendee, class_name: "User"
    belongs_to :event
end
