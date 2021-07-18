module UsersHelper
  def relationship(user)
    if user == current_user
      "self" 
    elsif current_user.friend?(user)
      "friend" 
    elsif current_user.pending_friend_request?(user)
      "pending"
    else
      "?"
    end
  end
end
