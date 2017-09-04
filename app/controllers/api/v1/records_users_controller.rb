class Api::V1::RecordsUsersController < ApplicationController
  # before_action :authenticate_user

  def create
    @user = User.find_by(email: params[:user_email])
    @record = Record.find(params[:file_id])
    if @record
      @records_user = RecordsUser.new(user_id: @user.id, record_id: @record.id)
    end
    if @records_user.save
      # WEBSOCKET BROADCAST FOR COLLABORATOR ADDITION
      render json: {status: 200}
    end
  end

end
