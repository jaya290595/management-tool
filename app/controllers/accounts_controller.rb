class AccountsController < ApplicationController
  def index
  	@account = Account.where(user_id: current_user.id).to_a
    @find_invitation = Invitation.where(user_id: current_user.id)
    @find_invitation.each do |invites|
      find_account = Account.find_by(id: invites.account_id)
      @account.push(find_account)
    debugger
    end
  end

  def new
  end

  def show
  	@account = Invitation.where(account_id: params[:id])
    @user_detail = []
    @account.each do |user|
      @user_detail << User.find_by_id(user.user_id)
    end
 end

private

  def account_params
  	params.require(:account).permit!
  end
end


def index
        @accounts = Account.where(user_id: current_user.id).to_a
        @invitations = Invitation.where(user_id: current_user.id)
        @invitations.each do |invitation|
            account = Account.find_by(id: invitation.account_id)
            @accounts.push(account)
        end
    end