class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :pict
  attr_accessible :pict_id, :user_id, :content
end
