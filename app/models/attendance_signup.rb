class AttendanceSignup < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def full_name
    user.full_name
  end

  def email
    user.email
  end

  def role
    user.role
  end
end
