class Api::V1::RecordsController < ApplicationController

  # For AllFiles component; need to add RecordsUsers as collaborators to each record
  def index
    @records = Record.all
    @records_users = RecordsUser.all.sort_by{ |rec| rec.updated_at }.sort{ |a, b| b <=> a }
    render json: {
      records: @records,
      records_users: @records_users
    }
  end

  def create
    @record = Record.new(name: params[:name], language: params[:language], content: params[:content], owner_id: params[:owner_id])
    @user = @record.owner
    if @record.save
      UserChannel.broadcast_to(@user, {
        user: {
          email: @user.email,
          profile_image_url: @user.profile_image_url
        },
        created_records: @user.created_records,
        partner_records: @user.records
      })
      render json: {record: @record, status: 200}
    else
      render json: {messages: @record.errors.full_messages, status: 400}
    end
  end

  def show
    @record = Record.find_by(id: params[:id])
    render json: {record: @record, messages: @record.messages, partners: @record.users}
    # RecordChannel.broadcast_to(@record, {record: @record})
  end

  def update
    @record = Record.find_by(id: params[:id])
    @record.update(record_params)
    render json: @record
    RecordChannel.broadcast_to(@record, {record: @record, messages: @record.messages, partners: @record.users})
  end

  def destroy
    @record = Record.find_by(id: params[:id])
    @user = @record.owner
    @record.destroy
    @records = Record.all
    UserChannel.broadcast_to(@user, {
      user: {
        email: @user.email,
        profile_image_url: @user.profile_image_url
      },
      created_records: @user.created_records,
      partner_records: @user.records
    })
    render json: @records
  end

  private
  def record_params
    params.require(:record).permit(:name, :language, :content, :owner_id)
  end

# index, show, new, edit, create, update and destroy

end
