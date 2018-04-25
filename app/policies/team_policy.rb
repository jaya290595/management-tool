class TeamPolicy < ApplicationPolicy

  def create?
 	if record.user_id == user.id  || Invitation.find_by(user_id: user.id, account_id: record.id)
 		return true
 	else
 		return false 		
 	end
  end

   def show?
  	if record.owner_id == user.id  || TeamMember.find_by(user_id: user.id)
  		return true
  	else
  		return false 		
  	end
   end
end