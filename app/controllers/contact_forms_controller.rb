class ContactFormsController < ApplicationController
  # GET /contact_forms/new
  def new
    @magasin = Store.find(1)
    @contact_form = ContactForm.new
  end

  # POST /contact_forms
  def create
    @contact_form = ContactForm.new(contact_form_params)

    if @contact_form.save
      ContactFormMailer.with(contact_form: @contact_form,
                             store_email: store_email,
                             contact_form_url: contact_form_url(id: @contact_form.id)).
        contact.deliver_later
      redirect_to params[:contact_form][:back],
        notice: I18n.t('controllers.contact_forms.create.successfully')
    else
      render :new, alert: I18n.t('controller.contact_forms.create.problem')
    end
  end
end
