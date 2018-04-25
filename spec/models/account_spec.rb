require 'rails_helper'

RSpec.describe Account, type: :model do

  describe ".all_accounts(user)" do
    it "return all accounts of that user" do
        user = create :user
        account = []
        account1 = create :account, user_id: user.id
        account << account1          
        another_user = create :user
        another_account = create :account, user_id: another_user.id        
        invitation = create :invitation, user_id: user.id, account_id: another_account.id
        account << another_account        
        return_accounts = Account.all_accounts(user)
        expect(return_accounts).to eq(account)
    end
  end
end
