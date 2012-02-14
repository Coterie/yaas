class Forum < ActiveRecord::Base
   has_many :topics
   belongs_to :user
   validates_presence_of :title
end
