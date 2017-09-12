class DirectoryChannel < ApplicationCable::Channel
  def subscribed
    @users = User.all
    stream_from "directory"
  end

  def received(data)
    @users = User.all.map{|user| {id: user.id, email: user.email, profile_image_url: user.profile_image_url}}    DirectoryChannel.broadcast_to("directory", {users: @user})
  end

  def unsubscribed
  end
end
