class Contact < ActiveRecord::Base
  
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  
  # shortcut validations, aka "sexy validations"
  validates :name, :presence => true
                        
  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX
  
  validates :message_body, :presence => true
  
end
