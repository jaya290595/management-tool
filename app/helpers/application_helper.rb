module ApplicationHelper
  def invite_button(account)
    @accounts = Account.find_by(user_id: current_user.id)
    return @accounts
  end

  def get_token(token)
    @invitation = Invitation.find_by_token(token).email
  end
end
