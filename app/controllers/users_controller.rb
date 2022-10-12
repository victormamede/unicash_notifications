# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[ update destroy ]

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def notifications
    @user = User.find(params[:user_id])
  end

  def login
    @user = User.find(params[:user_id])

    if @user.update(login_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :name, :email, :matricula)
    end

    def login_params
      params.require(:user).permit(:device_token)
    end
end
