class AccountPolicy < ApplicationPolicy

  def show?
    if @current_user.id == @current_account.user_id || Invitation.find_by(user_id: @current_user.id , account_id: @current_account.id)
        return true
    else
        return false
    end
  end

  def create_email?
    if @current_account.user_id == @current_user.id
        return true
    else
        return false        
    end
  end
end