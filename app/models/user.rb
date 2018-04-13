require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  belongs_to :chapter

  has_many :attendance_signups, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :first_capitalized, :last_capitalized, :valid_email

  def full_name
    "#{first_name} #{last_name}"
  end

  def password
    return unless password_hash
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def first_capitalized
    errors.add(:first_name, 'must be capitalized') if first_name && (first_name.first != first_name.first.upcase)
  end

  def last_capitalized
    errors.add(:last_name, 'must be capitalized') if last_name && (last_name.first != last_name.first.upcase)
  end

  def valid_email
    errors.add(:email, "must have an '@' and a '.'") if email && (!email.include?('@') || !email.include?('.'))
  end
end
