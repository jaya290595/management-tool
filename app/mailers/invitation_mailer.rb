class InvitationMailer < ApplicationMailer
  default from: "from@example.com"
 def invitation_email(email,token)
    @invitation = email
    @token = token
    mail(to: @invitation.email, subject: 'Sample Email')
  end

end
