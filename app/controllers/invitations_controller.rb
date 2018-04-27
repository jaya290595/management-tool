class InvitationsController < ApplicationController
  before_action :authenticate_user!, :except => [:checkuser]
  def new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.account_id = Account.find_by(id: params[:account_id]).id
    @account = Account.find_by_id(@invitation.account_id)
    authorize Account, :create_email?
    @invitation.token =  Digest::SHA1.hexdigest([Time.now, rand].join)
    if @invitation.save
      InvitationMailer.invitation_email(@invitation,@invitation.token).deliver_now
      redirect_to accounts_path
    end
  end

  def checkuser
    token = params[:token]
    redirect_to new_user_registration_path(token: token)
  end

private
  def invitation_params
    params.require(:invitation).permit!
  end
end
