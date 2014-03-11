class Page < ActiveRecord::Base
  translates :name, :title, :keyword, :description, :project_review_title, :project_review_short_description
  
  belongs_to :page_type
  # has_and_belongs_to_many :users
  has_and_belongs_to_many :editors, :class_name => "User"
  has_and_belongs_to_many :sections
end
