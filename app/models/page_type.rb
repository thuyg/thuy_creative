class PageType < ActiveRecord::Base
  
  has_many :pages
    
  # Don't need to validate (in most cases):
  # ids, foreign keys, timestamps, booleans, counters
  validates_presence_of :name_tag
  validates_length_of :name_tag, :maximum => 255
    # validates_presence_of vs. validates_length_of :minimum => 1
    # different error messages: "can't be blank" or "is too short"
    # validates_length_of allows strings with only spaces!
  
  # find the id of a page_type on its name_tag
  scope :project, lambda { where(:name_tag => 'project') }
  #scope :page_type_name_tag, lambda { |ptype_id| joins(:pages).where(:id => ptype_id) }
  
end
