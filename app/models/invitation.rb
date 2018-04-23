class Invitation < ApplicationRecord

  def self.get_invite account
    @account_invitation = Invitation.where(account_id: account).pluck(:user_id)
    @user_detail = User.where(id: @account_invitation)
    # @user_detail = []
    #@account_invitation.each do |user|
    #   @user_detail << User.total_invites(user.user_id)
    # end
    # return @user_detail
  end
end
