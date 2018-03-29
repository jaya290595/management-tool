class AccountsController < ApplicationController
  def index
  end


  def new
  end

private

def account_params
	params.require(:account).permit!
end
end
