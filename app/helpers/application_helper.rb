module ApplicationHelper
  def invite_button(account)
    @accounts = Account.find_by(user_id: current_user.id)
    return @accounts
  end
end
