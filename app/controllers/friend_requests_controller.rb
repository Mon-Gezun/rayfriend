class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.friend_requests.create(friend_id: params[:id])
    redirect_to :users, notice: "Friend request successfully created"
  end

  def destroy
    FriendRequest.delete(params[:id])
    redirect_to :users, notice: "Friend request cancelled"
  end
end
