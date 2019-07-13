class UserMailer < ApplicationMailer

  def invite_mail(email, request)
    @parameters = {
      invite_token: request.invite_token,
      pin: request.pin,
      sent_by: "User1",
      receiver_name: "User2"
    }

    mail(to: email, subject: "Amahi 12 Friending Invitation Mail")
  end

end