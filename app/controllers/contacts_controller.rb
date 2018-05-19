class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
      ContactMailer.new_contact(@contact).deliver_now
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  # def message 
  #   ContactMailer.new_contact(@contact).deliver_now
  # end

  protected
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
