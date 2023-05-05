class Api::V1::NotificationsController < ApplicationController
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      info = @notification.detail
      recipient_email = User.find_by_id(@notification.user_id).email
      MailServices.new.send_mail(info, recipient_email)

      render json: { message: "Notification sent 👍", notification: @notification }, status: :created
    else
      render json: { errors: @notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:detail, :status, :role, :user_id)
  end
end
