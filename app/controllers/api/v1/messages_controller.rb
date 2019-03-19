class Api::V1::MessagesController < ApplicationController

  def create
    @record = Record.find_by(id: params[:record_id])
    @user = User.find_by(id: params[:user_id])
    @message = Message.new(record_id: params[:record_id], content: params[:content], username: @user.email)
    if @message.save
      render json: {record: @record, messages: @record.messages, status: 200}
      RecordChannel.broadcast_to(@record, {record: @record, messages: @record.messages, partners: @record.users})
    else
      render json: {messages: @message.errors.full_messages, status: 400}
    end
  end

end
