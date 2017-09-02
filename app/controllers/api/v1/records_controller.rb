class Api::V1::RecordsController < ApplicationController

  def index
    @records = Record.all
    @records_users = RecordsUser.all
    render json: {
      records: @records,
      records_users: @records_users
    }
  end

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

  def update

  end

  private
  def record_params
    params.require(:record).permit(:name, :language, :content)
  end

# index, show, new, edit, create, update and destroy

end
