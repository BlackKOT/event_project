class SignTime < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :sign_in, :login
end
