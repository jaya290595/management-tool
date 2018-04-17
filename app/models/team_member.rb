class TeamMember < ApplicationRecord

  def self.team_member team_id
    @team_member = TeamMember.member(team_id)
    @checked_user = []
    @team_member.each do |user|
      @checked_user << User.total_invites(user.user_id)
    end
    return @checked_user
  end


  def self.member team_id
    @team_member = TeamMember.where(team_id: team_id)
  end


  def self.team user
    @team_member = TeamMember.where(user_id: user)

  end


  def self.other_team member
    @team_member = TeamMember.team(member)
    @other_teams = []
    @team_member.each do |member|
      @other_teams << Team.find_by(id: member.team_id)
    end
    return @other_teams
  end
end
