class ContactFormMailer < ApplicationMailer
  def contact
    contact_form = params[:contact_form]
    @firstname = contact_form[:firstname]
    @lastname = contact_form[:lastname]
    @email = contact_form[:email]
    @phone = contact_form[:phone]
    @message = contact_form[:message]
    mail(to: 'pascal.carrie@gmail.com'), subject: contact_form[:subject])
  end
end
