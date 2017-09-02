class Api::V1::RecordsUsersController < ApplicationController
  # before_action :authenticate_user

  def create
    @user = current_user
    @record = Record.find_by(id: params[:id])
    if @record
      @records_user = RecordsUser.new(user_id: @user.id, @record_id: @record.id)
      if @records_user.save
        # WEBSOCKET BROADCAST FOR COLLABORATOR ADDITION
      end
    end
  end

end
