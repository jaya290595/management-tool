class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    if params[:account_id].present?
      @current_account = Account.find_by_id(params[:account_id])
    elsif params[:id].present?
      @current_account = Account.find_by_id(params[:id])
    elsif params[:team][:account_id].present?
      @current_account = Account.find_by_id(params[:team][:account_id])
  end
     AccountContext.new(current_user, @current_account)
  end

  private
  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :account_name, :account_id1, :token])
    end
end
