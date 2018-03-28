class InvitationsController < ApplicationController
  before_action :authenticate_user!, :except => [:checkuser]
  def new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.account_id = (Account.where(user_id: current_user.id).first).id

    if @invitation.save
      InvitationMailer.invitation_email(@invitation).deliver_now
      redirect_to accounts_path
    end
  end

  # def show
  #   @invitation = Invitation.find(params[:id])
  # end

  def checkuser
    id = params[:account_id]
    email = params[:email]
    user = User.find_by_email(params[:email])
    if user
      redirect_to new_user_session_path
    else
      redirect_to new_user_registration_path(email: email, account_id: id)
    end
  end

private
  def invitation_params
    params.require(:invitation).permit!
  end
end
