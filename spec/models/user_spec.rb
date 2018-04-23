require 'rails_helper'

describe User do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
end

describe ".total_invites(user_id)" do
  it "return user with given user_id" do
  	user = create :user
  	account = (create :account, user_id: user.id)
  	other_user = create :user
  	invite = (create :invitation, account_id: account.id, user_id: other_user.id)
  	other_account = (create :account, user_id: other_user.id)
  	find_other_user = User.find_by_id(other_user.id)
  	find_user = User.total_invites(other_user.id)
  	expect(find_user).to eq(find_other_user)
  end
end