class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user, except: [:create]

  def index
    @users = User.all.map{|user| {id: user.id, email: user.email, profile_image_url: user.profile_image_url}}
    render json: @users
  end

  def cu
    render json: current_user
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.profile_image_url == ""
      @user.profile_image_url = "http://www.britishbattles.com/wp-content/uploads/2017/02/montague-dawson-the-battle-of-trafalgar_.jpg"
    end
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
        email: @user.email,
        profile_image_url: @user.profile_image_url
      }
    }
  end

  def created_records
    @records = current_user.created_records
    render json: @records
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :profile_image_url)
  end

end
