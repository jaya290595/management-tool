class AccountsController < ApplicationController
  def index
  	@account = Account.find_by(user_id: current_user.id)
  	@accounts = Account.all
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
