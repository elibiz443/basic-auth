class User < ApplicationRecord
  has_many :payments
  has_many :notifications
  has_many :movies
end
