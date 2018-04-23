class Account < ApplicationRecord

  def self.all_accounts user
    @owner_account = Account.where(user_id: user).pluck(:id)#.to_a
    @find_invitation = Invitation.where(user_id: user).pluck(:account_id)
    @total_accounts = (@owner_account + @find_invitation)
    @account = Account.where(id: @total_accounts )
    return @account
    
    # @find_invitation.each do |invites|
    #   find_account = Account.find(invites.account_id)
    #   @account.push(find_account) 
    # end 
  end
end
