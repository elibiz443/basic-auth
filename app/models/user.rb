class User < ApplicationRecord
  has_secure_password

  has_many :payments
  has_many :notifications
  has_many :movies

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: URI::MailTo::EMAIL_REGEXP}
end
