class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user, except: [:create]

  def index
    @users = User.all.map{|user| {id: user.id, username: user.username, email: user.email, profile_image_url: user.profile_image_url}}
    render json: @users
  end

  def cu
    render json: current_user
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.save
      render json: {status: 200}
    else
      render json: {messages: @user.errors.full_messages, status: 400}
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: {
      user: {
        username: @user.username,
        email: @user.email,
        profile_image_url: @user.profile_image_url
      }
    }
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :profile_image_url)
  end

end
