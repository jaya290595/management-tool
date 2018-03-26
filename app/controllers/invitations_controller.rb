class InvitationsController < ApplicationController
  def new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      InvitationMailer.invitation_email(@invitation).deliver_now
      redirect_to accounts_path
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

private
  def invitation_params
    params.require(:invitation).permit!
  end
end
