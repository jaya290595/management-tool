class AccountPolicy < ApplicationPolicy
  def index?
  end

  def show?
 	if user.id == record.user_id || Invitation.find_by(user_id: user.id , account_id: record.id)
 		return true
 	else
 		return false
  	end
  end
end