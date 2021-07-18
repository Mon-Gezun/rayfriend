class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def destroy
    Connection.delete(params[:id])
    redirect_to :users, notice: "Unfriended successfully"
  end
end
