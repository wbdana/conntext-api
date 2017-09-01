class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.save
      render json: {status: 200}
    else
      render json: {messages: @user.errors.full_messages, status: 400}
    end
  end

  def cu
    render json: current_user
  end

  def show
    render json: current_user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :profile_image_url)
  end

end
