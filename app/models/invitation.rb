class Invitation < ApplicationRecord

  def self.get_invite account
    @account = Invitation.where(account_id: account)
    @user_detail = []
    @account.each do |user|
      @user_detail << User.total_invites(user.user_id)
    end
    return @user_detail
  end
end
