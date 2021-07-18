class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def create
    current_user.friend_requests.create(friend_id: params[:user_id])
    redirect_to :users, notice: "Friend request successfully created"
  end

  def destroy
    Connection.delete(params[:id])
    redirect_to :users, notice: "Unfriended successfully"
  end
end
