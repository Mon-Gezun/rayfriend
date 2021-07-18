module UsersHelper
  def relationship(user)
    if user == current_user
      "self"
    elsif current_user.friend?(user)
      "friend"
    elsif current_user.pending_friend_request?(user)
      "pending"
    else
      ""
    end
  end

  def action(user)
    if current_user.pending_connect_request?(user)
      "<div class='nowrap'>
        #{button_to('Accept', friend_request_path(
          current_user.pending_connect_request(user)
        ), method: :patch)}
        #{button_to('Reject', friend_request_path(
            current_user.pending_connect_request(user)
          ), method: :delete,
          data: { confirm: "Reject friend request?" }
        )}
      <div>".html_safe

    elsif current_user.friend_requestable?(user)
      button_to(
        "Friend Request",
        friend_requests_url(id: user.id, method: :post)
      )

    elsif current_user.friend?(user)
      button_to "Unfriend",
        {
          controller: :friends,
          action: 'destroy',
          id: current_user.connection(user).id
        },
        method: :delete,
        data: { confirm: "Would you like to unfriend?" }

    elsif current_user.pending_friend_request?(user)
      button_to "Cancel",
        {
          controller: :friend_requests,
          action: 'destroy',
          id: current_user.friend_request(user).id
        },
        method: :delete,
        data: { confirm: "Cancel friend request?" }
    else
      ""
    end
  end
end
