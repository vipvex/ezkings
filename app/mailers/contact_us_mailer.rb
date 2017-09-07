class ContactUsMailer < ApplicationMailer
  default from: "ez@ezkingscards.com"

  def contact_us(email, subject, message)
    @message = message
    mail(to: 'alexandersyurchenko@gmail.com', subject: subject) #blsca@yahoo.com
  end
end
