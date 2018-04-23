class Team < ApplicationRecord
  def invitation
    @account = Account.find_by(id: account_id)
    @invitation = Invitation.where(account_id: @account.id).pluck(:user_id)
    @user_details = User.where(id: @invitation)
    return @user_details
    # @user_details = []
    # @invitation.each do |invite|
    #   @user_details << User.total_invites(invite.user_id)
    # end
    # @user_details 
  end
end
