class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    FriendRequest.delete(params[:id])
    redirect_to :users, notice: "Friend request cancelled"
  end
end
