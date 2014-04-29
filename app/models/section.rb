class Section < ActiveRecord::Base
  translates :content
  
  belongs_to :section_type
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "User"
  has_and_belongs_to_many :pages
  
  #acts_as_list :scope => :page # not working with this one because cannot find page_id ... need to add @page = Page. something in the sections_controller ...
  acts_as_list
  
  after_save :touch_section_type
  
  validates_presence_of :name_tag
  validates_length_of :name_tag, :maximum => 255
  
  validates_presence_of :content
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("sections.position ASC") }
  scope :newest_first, lambda { order("sections.created_at DESC")}
  scope :tag_line_section, lambda { where(:name_tag => 'tag-line') }
  scope :copyright_section, lambda { where(:name_tag => 'copyright') }
  scope :about_us_section, lambda { where(:name_tag => 'about-us') }
  
  # find the translation of a section
  #scope :section_content, lambda { |s_id, loc| {:include => :section_translations, 
   # :conditions => {:section_translations => {:section_id => s_id, :locale => loc} } } }
  
  private
    def touch_section_type
      # touch is similar to:
      # section_type.update_attribute(:updated_at, Time.now)
      section_type.touch
    end
  
end