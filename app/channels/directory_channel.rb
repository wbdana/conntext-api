class DirectoryChannel < ApplicationCable::Channel
  def subscribed
    @users = User.all
    stream_from "directory"
  end

  def received(data)
    @users = User.all
    DirectoryChannel.broadcast_to("directory", {users: @user})
  end

  def unsubscribed
  end
end
