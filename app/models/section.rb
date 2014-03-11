class Section < ActiveRecord::Base
  translates :content
  
  belongs_to :section_type
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "User"
  has_and_belongs_to_many :pages
end
