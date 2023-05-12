class Movie < ApplicationRecord
  belongs_to :user

  validates :movie_link, presence: true, uniqueness: true
  validates :title, presence: true
  validates :movie_type, presence: true
  validates :release_date, presence: true
  validates :movie_icon, presence: true
end
