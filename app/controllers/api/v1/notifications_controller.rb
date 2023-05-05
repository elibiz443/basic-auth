class Api::V1::NotificationsController < ApplicationController
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: { message: "Notification sent 👍", notification: @notification }, status: :created
    else
      render json: { errors: @notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.permit(:detail, :status, :role, :user_id)
  end
end
