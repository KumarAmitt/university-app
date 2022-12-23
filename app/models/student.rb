class Student < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
end
