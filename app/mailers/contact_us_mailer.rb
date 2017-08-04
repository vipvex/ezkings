class ContactUsMailer < ApplicationMailer
  default from: "contact_us@ezkingscards.com"

  def contact_us(email, subject, message)
    @message = message
    mail(to: 'alexandersyurchenko@gmail.com', subject: subject) #blsca@yahoo.com
  end
end
