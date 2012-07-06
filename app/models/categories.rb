class Categories < ActiveRecord::Base
 has_many :picts
 def to_param
   name.parameterize
 end
end
