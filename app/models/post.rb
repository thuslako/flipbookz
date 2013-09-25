class Post < ActiveRecord::Base
  
  include Paperclip::Glue
  belongs_to(:user)
  attr_accessible :title, :desc, :img
  
  has_attached_file :img, :styles => { :large => "800x600>" ,:medium => "100x100", :thumb => "50x50" }
  
  validates_attachment_presence :img
  validates :title, :presence => true 
  validates :desc, :presence => true 


end
