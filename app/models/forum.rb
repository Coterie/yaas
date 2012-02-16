class Forum < ActiveRecord::Base
   has_many :topics, dependent: :destroy 
   has_many :posts, dependent: :destroy 
   has_many :moderatorships, :dependent => :delete_all
   has_many :moderators, :through => :moderatorships, :source => :user

   belongs_to :user
   validates_presence_of :title
end
