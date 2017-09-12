class DirectoryChannel < ApplicationCable::Channel
  def subscribed
    @users = User.all
    @user_dir = User.find_by(id: params[:room])
    stream_for @user_dir
  end

  def received(data)
    @users = User.all.map{|user| {id: user.id, email: user.email, profile_image_url: user.profile_image_url}}
    @user_dir = User.find_by(id: 1)
    DirectoryChannel.broadcast_to(@user_dir, {users: @user})
  end

  def unsubscribed
  end
end
