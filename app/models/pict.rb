class Pict < ActiveRecord::Base
  has_many :likes
  has_many :comments
  belongs_to :categories
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "128x128>" }
  attr_accessible :like_count
  default_scope :order => 'like_count desc'
  #self.per_page = 10
end
