class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    binding.pry
    @friends = current_user.friends
  end
end
