class TeamPolicy < ApplicationPolicy

  def show?
    if record.owner_id == @current_user.id  || TeamMember.find_by(user_id: @current_user.id)
      return true
    else
      return false
  end
end

  def create_room?
    if record.owner_id == @current_user.id  || TeamMember.find_by(user_id: @current_user.id)
      return true
    else
      return false        
    end
  end
end