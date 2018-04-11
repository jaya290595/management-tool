class Account < ApplicationRecord

  def self.all_accounts user
    @account = Account.where(user_id: user).to_a
    @find_invitation = Invitation.where(user_id: user)
    @find_invitation.each do |invites|
      find_account = Account.find_by(id: invites.account_id)
      @account.push(find_account) 
    end 
    @account
  end
end
