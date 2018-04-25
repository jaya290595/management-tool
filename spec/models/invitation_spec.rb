require 'rails_helper'

RSpec.describe Invitation, type: :model do

  describe ".get_invite(account)" do
    it "return all details of user" do
      account = create :account
      invite = create :invitation, account_id: account.id
      user = create :user, id: invite.user_id
      details = []
      details << user
      user_detail = Invitation.get_invite(account)
      expect(user_detail).to eq(details)
    end
  end
end
