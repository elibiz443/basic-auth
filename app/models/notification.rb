class Notification < ApplicationRecord
  before_create :capture_detail
  belongs_to :user

  def capture_detail
    self.detail = "Welcome to Netflix! Your subscription has been received!"
  end
end
