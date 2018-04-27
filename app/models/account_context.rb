class AccountContext
attr_reader :current_user, :current_account

  def initialize(current_user, current_account)
    @current_user = current_user
    @current_account = current_account
  end
end
