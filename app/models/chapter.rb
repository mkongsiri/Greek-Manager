class Chapter < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :greek_type, :name, :chapter_name, presence: true
end
