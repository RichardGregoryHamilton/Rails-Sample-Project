class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Your message has been submitted. We will reach back to you soon.'
      redirect_to games_path
    else
      render :new
    end
  end
   
end
