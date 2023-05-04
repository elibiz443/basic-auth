class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: { user: @users }, status: :ok
  end

  def show
    render json: { user: @user }, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: "User created successfully 👍", user: @user }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { message: "User updated successfully 👍", User: @user }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: { message: "User destroyed ❌" }, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:full_name, :email, :role, :password, :password_confirmation)
  end
end
