class Invitation < ApplicationRecord

  def self.get_invite account
    @account = Invitation.where(account_id: account)
    @user_detail = []
    @account.each do |user|
      @user_detail << User.team_id(user.user_id)
    end
    @user_detail
  end
end
