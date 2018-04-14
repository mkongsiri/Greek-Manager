class Event < ApplicationRecord
  has_many :attendance_signups, dependent: :destroy

  validates :event_type, :date, :name, :description, presence: true

  def attendees
    AttendanceSignup.where(event: self)
  end
end
