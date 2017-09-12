class UserChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find_by(id: params[:room])
    stream_for @user
  end

  def received(data)
    UserChannel.broadcast_to(@user, {user: @user})

  def unsubscribed
  end
end
