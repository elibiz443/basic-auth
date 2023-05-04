class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user
      render json: { message: "User created successfully 👍", user: @user }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:full_name, :email, :role, :password_digest)
  end
end
