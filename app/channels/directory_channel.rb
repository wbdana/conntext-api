class DirectoryChannel < ApplicationCable::Channel
  def subscribed
    @users = User.all
    @user = User.find_by(id: params[:room])
    stream_for @user
  end

  def received(data)
    @users = User.all.map{|user| {id: user.id, email: user.email, profile_image_url: user.profile_image_url}}
    DirectoryChannel.broadcast_to("directory", {users: @user})
  end

  def unsubscribed
  end
end
