class Like < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :pict_id
  belongs_to :pict
  attr_accessible :pict_id, :user_id
end
