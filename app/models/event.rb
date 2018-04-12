class Event < ApplicationRecord
  belongs_to :chapter

  has_many :attendance_signups, dependent: :destroy

  validates :type, :date, :name, :description, presence: true
end
