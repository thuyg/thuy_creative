class ContactController < ApplicationController
  
  layout 'public'
  
  before_action :setup_navigation

  def index
  end
  
  def new
    @contact = Contact.new
  end
  
  #def dispatch_email
   #   user_info = params[:user_info]
    #  if ContactMailer.send_email(user_info).deliver
     #   flash[:notice] = "Sent!"
    #  else
    #    flash[:notice] = "Could not send you message."
    #  end
    #  redirect_to contact_url
 # end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
        flash[:notice] = 'Contact created successfully.'
        
       # Tell the ContactMailer to send an email after save
       name = @contact.name
       email = @contact.email
       body = @contact.message_body
       if ContactMailer.send_email(name, email, body).deliver
         flash[:notice] = "Sent!"
       else
         flash[:notice] = "Could not send you message."
       end
       
       redirect_to(:action => 'index')
    else
      render('new')
    end
    
  end
  
  private
    def setup_navigation
      @pages = Page.visible.sorted
    end
    
    def contact_params
      params.require(:contact).permit(:name, :email, :message_body)
    end
  
end
