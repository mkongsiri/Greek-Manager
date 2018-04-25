class AttendanceSignupsController < ApplicationController
  before_action :set_user, :set_event, only: [:create, :destroy]

  def new
    @signup = AttendanceSignup.new
  end

  def create
    @signup = AttendanceSignup.create(user: @user, event: @event)

    redirect_to root_path
  end

  def destroy
    AttendanceSignup.find_by(user: @user, event: @event).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_user
    @user = current_user
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def attendance_signups_params
    params.require(:attendance_signups).permit(:user, :event_id)
  end
end
