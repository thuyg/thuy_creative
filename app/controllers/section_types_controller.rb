class SectionTypesController < ApplicationController
  
  layout 'admin'
  
  before_action :confirm_logged_in
  
  def index
    # list all the records
    @section_types = SectionType.all
  end

  def show
    # display a single record
     @section_type = SectionType.find(params[:id])
  end

  def new
    # display new record form
    @section_type = SectionType.new({:name_tag => 'default'})
  end
  
  def create
    # Initiate a new object using parameters
    @section_type = SectionType.new(section_type_params)
    # Save the object
    # If save succeds, redirect to the index action
    if @section_type.save
      flash[:notice] = "Section Type created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the new form so user can fix problems
      render('new')
    end
  end

  def edit
    # Display edit record form
    @section_type = SectionType.find(params[:id])
  end
  
  def update
     # Initiate a new object using parameters
     @section_type = SectionType.find(params[:id])
     # Save the object
     # If save succeds, redirect to the show action
     if @section_type.update_attributes(section_type_params)
       flash[:notice] = "Section Type updated successfully."
       redirect_to(:action => 'show', :id => @section_type.id)
     else
       # If save fails, redisplay the edit form so user can fix problems
       render('edit')
     end
   end

  def delete
    @section_type = SectionType.find(params[:id])
  end
  
  def destroy
    section_type = SectionType.find(params[:id]).destroy
    flash[:notice] = "Section Type '#{section_type.name_tag}' destroyed successfully."
   	redirect_to(:action => 'index')
  end
  
  private
   def section_type_params
     # same as using "params[:section_type]", except that it:
     # - raises an error if :section_type is not present
     # - allows listed attributes to be mass-assigned
     params.require(:section_type).permit(:name_tag)
   end

end
