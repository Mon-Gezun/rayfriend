class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.friend_requests.create(friend_id: params[:id])
    redirect_to :users, notice: "Friend request successfully created"
  end

  def update
    friend_req = FriendRequest.find(params[:id])
    friend_req.update(accepted: true)

    Connection.create(
      user_id: friend_req.user_id,
      friend_id: friend_req.friend_id
    )
    Connection.create(
      user_id: friend_req.friend_id,
      friend_id: friend_req.user_id
    )

    redirect_to :users, notice: "You are now connected!"
  end

  def destroy
    FriendRequest.delete(params[:id])
    redirect_to :users, notice: "Friend request cancelled"
  end
end
