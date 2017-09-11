class Api::V1::RecordsUsersController < ApplicationController
  # before_action :authenticate_user

  def create
    @user = User.find_by(email: params[:user_email])
    @record = Record.find(params[:file_id])
    if @record
      @records_user = RecordsUser.new(user_id: @user.id, record_id: @record.id)
    end
    if @records_user.save
      RecordChannel.broadcast_to(@record, {record: @record, messages: @record.messages, partners: @record.users})
      render json: {status: 200}
    end
  end

  def destroy
    @records_user = RecordUser.find_by(record_id: params[:record_id], user_id: params[:user_id])
    @record = Record.find_by(id: params[:record_id])
    @records_user.destroy
    RecordChannel.broadcast_to(@record, {record: @record, messages: @record.messages, partners: @record.users})
  end

end
