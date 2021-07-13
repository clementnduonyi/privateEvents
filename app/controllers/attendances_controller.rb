class AttendancesController < ApplicationController

    def attendance
        event = Event.find(:event_id)
        attendance = Attendance.new(event_id: event.id, attendee_id: attendee(params[:attendee_id]))

        if attendance.any?
            attendance.invite!.save
            flash[:notice] = "Invited successfully"
            redirect_to users_path(event_id: event.id)
        else
            flash[:alert] = "Something went wrong! contact event owner"
            redirect_to event_path(event)
        end
    end


end