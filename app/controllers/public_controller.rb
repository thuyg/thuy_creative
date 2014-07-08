class PublicController < ApplicationController
  
  layout 'public'
  before_action :setup_navigation
  
  def index
    # TODO: redirect to portfolio page
  end

  def show
    @page = Page.where(:permalink => params[:permalink], :visible => true).first
    @sections = @page.sections.visible.sorted
    if @page.nil?
      redirect_to(:action => 'index')
    else
      # display the page content using show.html.erb
    end
  end
  
  def contact
  end
  
  def dispatch_email
      user_info = params[:user_info]
      if ContactMailer.send_email(user_info).deliver
        flash[:notice] = "Sent!"
      else
        flash[:notice] = "Could not send you message."
      end
      redirect_to contact_url
  end
  
  private
    def setup_navigation
      @pages = Page.visible.sorted
    end
  
end
