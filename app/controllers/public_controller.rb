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
  
  private
    def setup_navigation
      @pages = Page.visible.sorted
    end
  
end
