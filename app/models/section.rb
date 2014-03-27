class Section < ActiveRecord::Base
  translates :content
  
  belongs_to :section_type
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "User"
  has_and_belongs_to_many :pages
  
  validates_presence_of :name_tag
  validates_length_of :name_tag, :maximum => 255
  
  validates_presence_of :content
  
  scope :sorted, lambda { order("sections.position ASC") }
  
end
