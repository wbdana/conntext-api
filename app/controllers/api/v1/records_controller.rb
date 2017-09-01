class Api::V1::RecordsController < ApplicationController
  before_action :authenticate_user

  def create
    @record = Record.new(record_params)
    if @record.save
      render json: {status: 200}
    else
      render json: {messages: @record.errors.full_messages, status: 400}
    end
  end

  def show
    @record = Record.find_by(id: params[:id])
    render json: @record
  end

  private
  def record_params
    params.require(:record).permit(:name, :language, :content)
  end



end
