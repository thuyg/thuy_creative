class Page < ActiveRecord::Base
  translates :name, :title, :keyword, :description, :project_review_title, :project_review_short_description
  
  belongs_to :page_type
  # has_and_belongs_to_many :users
  has_and_belongs_to_many :editors, :class_name => "User"
  has_and_belongs_to_many :sections
  
  validates_presence_of :name_tag
  validates_length_of :name_tag, :maximum => 255
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  validates_presence_of :title
  validates_length_of :title, :maximum => 65
  validates_presence_of :description
  validates_length_of :description, :minimum => 50, :maximum => 156
  
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence with length to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by page_type, :scope => :page_type_id
  
  scope :sorted, lambda { order("pages.position ASC") }
  
end
