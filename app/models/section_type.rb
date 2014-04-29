class SectionType < ActiveRecord::Base
  
  has_many :sections
  
  validates_presence_of :name_tag
  validates_length_of :name_tag, :maximum => 255
  
  # find the nam_tag of a section_type
  # based on the foreign key in sections table section_type_id
  scope :section_type_name_tag, lambda { |stype_id| joins(:sections).where(:id => stype_id) }  
  
end
