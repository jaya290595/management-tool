class TeamMember < ApplicationRecord
  class << self
    def team_member team_id
      @team_member = TeamMember.member(team_id).pluck(:user_id)
      @checked_user = User.where(id: @team_member)
      return @checked_user
      # @checked_user = []
      # @team_member.each do |user|
      #   @checked_user << User.total_invites(user.user_id)
      # end
      # return @checked_user
    end


    def member team_id
      @team_member = TeamMember.where(team_id: team_id)
    end


    def team user
      @team_member = TeamMember.where(user_id: user)

    end

    def other_team member
      @team_member = TeamMember.team(member).pluck(:team_id)
      @other_teams = Team.where(id: @team_member)
      return @other_teams
      # @team_member.each do |member|
       #   @other_teams << Team.find_by(id: member.team_id)
       # end
    end
  end
end
