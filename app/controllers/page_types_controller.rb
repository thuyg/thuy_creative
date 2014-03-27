class PageTypesController < ApplicationController
  
  #layout false # turn off layout
  layout 'admin' # use admin layout
  
  before_action :confirm_logged_in
  
  def index
    # list all records
    # @page_types is an instance variable used in view
   	@page_types = PageType.all
  end

  def show
    # display single record with id get from the url
   	@page_type = PageType.find(params[:id])
  end

  def new
    # display new record form
    @page_type = PageType.new({:name_tag => 'default'})
  end
  
  def create
   # process new record form 
   # Instantiate a new object using form parameters
   @page_type = PageType.new(page_type_params)
   # Save the object
   if @page_type.save
     # If save succeeds, redirect to the show action
     flash[:notice] = "Page Type created successfully."
     redirect_to(:action => 'index')
   else
       # If save fails, redisplay the form so user can fix problems - render new template
       render('new')
   end
  end

  def edit
    	@page_type = PageType.find(params[:id])
  end

  def update
  	# Find object using form parameters
     @page_type = PageType.find(params[:id])
     # Update the object
     if @page_type.update_attributes(page_type_params)
       # If update succeeds, redirect to the show action
       flash[:notice] = "Page Type updated successfully."
       redirect_to(:action => 'show', :id => @page_type.id)
       #redirect_to(:action => 'show', :id => @page_type.id, :notice => "Page Type updated successfully.")
     else
       # If update fails, redisplay the form so user can fix problems
       render('edit')
     end
  end
  
  def delete
    @page_type = PageType.find(params[:id])
  end
  
  def destroy
    # page_type is a local variable
   	page_type = PageType.find(params[:id]).destroy
   	flash[:notice] = "Page Type '#{page_type.name_tag}' destroyed successfully."
   	redirect_to(:action => 'index')
  end
  
  private

    def page_type_params
      # same as using "params[:page_type]", except that it:
      # - raises an error if :page_type is not present
      # - allows listed attributes to be mass-assigned
      params.require(:page_type).permit(:name_tag)
    end
    
end
