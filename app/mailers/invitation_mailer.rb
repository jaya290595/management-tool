class InvitationMailer < ApplicationMailer

    default from: "from@example.com"

    def invitation_email(email)

        @invitation = email
        mail(to: @invitation.email, subject: 'Sample Email')
    end

end
