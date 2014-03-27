class SectionType < ActiveRecord::Base
  
  has_many :sections
  
  validates_presence_of :name_tag
  validates_length_of :name_tag, :maximum => 255
  
end
