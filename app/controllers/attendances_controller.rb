class AttendancesController < ApplicationController

    def attendance
        event = Event.find(params[:event_id])
        attendances = Attendance.new(event_id: event.id, attendee_id: attendee(params[:attendee_id]))

        if attendances.save
            attendances.invite_sent!
            flash[:notice] = "Invited successfully"
            redirect_to users_path(event_id: event.id)
        else
            flash[:alert] = "Something went wrong! contact event owner"
            redirect_to event_path(event)
        end
    end


end