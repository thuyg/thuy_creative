class Page < ActiveRecord::Base
  translates :name, :title, :keyword, :description, :project_review_title, :project_review_short_description
  
  belongs_to :page_type
  # has_and_belongs_to_many :users
  has_and_belongs_to_many :editors, :class_name => "User"
  has_and_belongs_to_many :sections
  
  acts_as_list
  
  before_validation :add_default_permalink
  after_save :touch_page_type
  
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
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC")}
  
  scope :page_by_page_type_id, lambda { |ptype_id| where(:page_type_id => ptype_id) } 
  
  private

    def add_default_permalink
      if permalink.blank?
        # setting an attribute in a class, should use self.
        # parameterize - convert a string to an acceptable url format
        self.permalink = "#{id}-#{name.parameterize}"
      end
    end
  
    def touch_page_type
      # touch is similar to:
      # page_typet.update_attribute(:updated_at, Time.now)
      page_type.touch
    end
      
end
