class InvitationPolicy < ApplicationPolicy

  def create?
 	if record.user_id == user.id
 		return true
 	else
 		return false 		
 	end
  end
end