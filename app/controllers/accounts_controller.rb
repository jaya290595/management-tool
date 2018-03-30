class AccountsController < ApplicationController
  def index
  	@account = Account.find_by(user_id: current_user.id)
  	@accounts = Account.all
  end


  def new
  end

  def show
  	@account = Account.find(params[:id])
  	@account1 = Invitation.find_by(account_id: params[:id])
  	@user = User.find_by(id: @account1.user_id)
 end

private

def account_params
	params.require(:account).permit!
end
end
