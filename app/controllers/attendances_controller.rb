class AttendancesController < ApplicationController
    before_action :authenticate_user!, only: [:show]

  def create
      event = Event.find(params[:event_id])
      attendance = Attendance.new(event_id: event.id, attendee_id: params[:attendee_id])

      if attendance.save
          attendance.invite_sent!
          flash[:notice] = "Invited successfully"
          redirect_to users_path(event_id: event.id)
      else
          flash[:alert] = "Something went wrong! contact event owner"
          redirect_to event_path(event)
      end
  end

  def destroy
    event = Event.find(params[:event_id])
    attendance = Attendance.find(params[:id])
    if current_user == event.creator
        attendance.destroy
        flash[:notice] = "The invitation is cancelled!"
    else
        attendance.invite_sent!
        flash[:notice] = "You have indicated to attend #{@event.theme} event!"
    end

    redirect_to users_path(event_id: event.id, id: attendance.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find_by(event_id: params[:event_id], attendee: current_user.id)
    if @attendance && @attendance.invite_sent?
      @attendance.attending!
      flash[:notice] = "Thank you for signing up for the '#{@event.theme}'!"
    else
      flash[:alert] = 'Your name is not on the invitation list'
    end

    redirect_to event_path(@event)
  end
end