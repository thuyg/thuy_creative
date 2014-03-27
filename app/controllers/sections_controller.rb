class SectionsController < ApplicationController
  
  layout 'admin' # use admin layout
  
  before_action :confirm_logged_in
  before_action :find_section_type
  
  def index
    #@sections = Section.all
    @sections = @section_type.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:section_type_id => @section_type.id)
    @section_types = SectionType.order('name_tag ASC')
    @section_count = Section.count + 1
  end
  
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index', :section_type_id => @section_type.id)
    else
      @section_types = SectionType.order('name_tag ASC')
      @section_count = Section.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_types = SectionType.order('name_tag ASC')
    @section_count = Section.count
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id, :section_type_id => @section_type.id)
    else
      @section_types = SectionType.order('name_tag ASC')
      @section_count = Section.count
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name_tag}' destroyed successfully."
   	redirect_to(:action => 'index', :section_type_id => @section_type.id)
  end
  
  private

    def section_params
      # same as using "params[:section]", except that it:
      # - raises an error if :section is not present
      # - allows listed attributes to be mass-assigned
      params.require(:section).permit(:section_type_id, :name_tag, :position, :visible, :content)
    end
    
    def find_section_type
       if params[:section_type_id]
        @section_type = SectionType.find(params[:section_type_id]) 
       end
   end
   
end
