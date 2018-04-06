class TeamMember < ApplicationRecord

  def self.check_member team_id
    debugger
    @team_member = TeamMember.where(team_id: team_id)
    @member_details = []
    @team_member.each do |member|
      @member_details << User.find_by_id(member.user_id)
   end
  end 

end
