class ContactFormMailer < ApplicationMailer
    def contact_email(contact_form)
        @contact_form = contact_form
        mail(to: 'posilinkcontact@gmail.com', subject: 'Nouveau message de contact')
      end
end
