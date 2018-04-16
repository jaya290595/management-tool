require 'rails_helper'

RSpec.describe TeamMember, type: :model do

  describe ".team_member(team_id)" do
    it "return all team members" do
      owner = create :user
      account =(create :account, user_id: owner.id)
      team = (create :team, owner_id: owner.id)
      member = create :user
      invite = (create :invitation, account_id: account.id, user_id: member.id)
      team_member = (create :team_member, team_id: team.id, user_id: member.id)
      user = User.find(member.id) 
      members = []
      members << user
      details = TeamMember.team_member(team.id)
      expect(details).to eq(members)
    end
  end

  describe ".member(team_id)" do
    it "returns team members with team id given" do
       owner = create :user
       account =(create :account, user_id: owner.id)
       team = (create :team, owner_id: owner.id)
       member = create :user
       invite = (create :invitation, account_id: account.id, user_id: member.id)
       team_member = (create :team_member, team_id: team.id, user_id: member.id)
       team_members = TeamMember.where(team_id: team.id)
       members = TeamMember.member(team.id)
       expect(members).to eq(team_members)
    end
  end

  describe ".team(team_id)" do
    it "returns team members with user id id given" do
      owner = create :user
      account =(create :account, user_id: owner.id)
      team = (create :team, owner_id: owner.id)
      member = create :user
      invite = (create :invitation, account_id: account.id, user_id: member.id)
      team_member = (create :team_member, team_id: team.id, user_id: member.id)
      team_members = TeamMember.where(user_id: member.id)
      members = TeamMember.team(member.id)
      expect(members).to eq(team_members)
    end
  end

  # describe ".other_team(member)" do
  #   it "returns all teams with user id id given" do
  #     owner = create :user
  #     account =(create :account, user_id: owner.id)
  #     team = (create :team, owner_id: owner.id)
  #     member = create :user
  #     invite = (create :invitation, account_id: account.id, user_id: member.id)
  #     team_member = (create :team_member, team_id: team.id, user_id: member.id)
  #     other_teams = []
  #     other_teams << Team.find(team_member.team_id)
  #     members = TeamMember.other_team(member.id)
  #     expect(other_teams).to eq(members)
  #   end
  # end

end
