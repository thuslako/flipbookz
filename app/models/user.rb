class User < ActiveRecord::Base

  attr_accessible(:first_name, :last_name, :email, 
                  :password, :password_confirmation)
  
  validates(:first_name, :presence => true)
  validates(:last_name,  :presence => true)
  validates(:email,      :presence => true, :format => /^.+@.+/)
  has_secure_password
  has_many(:posts)
  
  def self.clean_email (email)
    email.to_s.strip.downcase
  end
  

  def self.authenticate (email, clear_text_password)
    find_by_email(clean_email(email)).try(:authenticate, clear_text_password)
  end
  
  ##############################################################################
  private

  before_validation do
    
    self.email = self.class.clean_email(email)

  end
end
