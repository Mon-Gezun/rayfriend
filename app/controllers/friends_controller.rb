class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def destroy
    conn = Connection.find(params[:id])

    Connection.find_by(friend_id: conn.user_id).delete
    conn.delete

    redirect_to :users, notice: "Unfriended successfully"
  end
end
