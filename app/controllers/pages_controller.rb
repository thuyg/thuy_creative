class PagesController < ApplicationController
  
  layout 'admin' # use admin layout
  
  before_action :confirm_logged_in
  before_action :find_page_type
  before_action :find_sections
  
  def index
    #@pages = Page.where(:page_type_id => @page_type.id).sorted
    @pages = @page_type.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:page_type_id => @page_type.id)
    @page_types = PageType.order('name_tag ASC')
    @page_count = Page.count + 1
    @sections = Section.all
  end
  
  def create
   # process new record form 
   # Instantiate a new object using form parameters
   @page = Page.new(page_params)
   # Save the object
   if @page.save
     # If save succeeds, redirect to the show action
     flash[:notice] = "Page created successfully."
     redirect_to(:action => 'index', :page_type_id => @page_type.id)
   else
       # If save fails, redisplay the form so user can fix problems - render new template
       @page_types = PageType.order('name_tag ASC')
       @page_count = Page.count + 1
       render('new')
   end
  end

  def edit
    @page = Page.find(params[:id])
    @page_types = PageType.order('name_tag ASC') 
    @page_count = Page.count
    @sections = Section.all
  end
  
  def update
    @page = Page.find(params[:id])
    # Update the object
    if @page.update_attributes(page_params)
      # If update succeeds, redirect to the show action
       flash[:notice] = "Page updated successfully."
       redirect_to(:action => 'show', :id => @page.id, :page_type_id => @page_type.id)
       #redirect_to(:action => 'show', :id => @page.id, :notice => "Page updated successfully.")
     else
       # If update fails, redisplay the form so user can fix problems
       @page_types = PageType.order('name_tag ASC')
       @page_count = Page.count
       render('edit')
     end
  end

  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name_tag}' destroyed successfully."
   	redirect_to(:action => 'index', :page_type_id => @page_type.id)
  end
  
  private

    def page_params
      # same as using "params[:page]", except that it:
      # - raises an error if :page is not present
      # - allows listed attributes to be mass-assigned
      params.require(:page).permit(:page_type_id, :name_tag, :position, :visible, :permalink, :name, :title, :keyword, :description, :project_review_title, :project_review_short_description, :project_review_img, {:section_ids => []})
    end
    
    def find_page_type
      if params[:page_type_id]
        @page_type = PageType.find(params[:page_type_id])
      end
    end
    
    def find_sections
      if Section.all
        @sections = Section.all
      end
    end
    
end
