module UsersHelper
  def relationship(user)
    if user == current_user
      "self" 
    elsif current_user.friend? user
      "friend" 
    else
      "?"
    end
  end
end
