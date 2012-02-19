class Forum < ActiveRecord::Base
   has_many :topics, dependent: :destroy 
   has_many :posts, dependent: :destroy 
   has_many :moderatorships, :dependent => :delete_all
   has_many :moderators, :through => :moderatorships, :source => :user

   belongs_to :user
   validates_presence_of :title
  
  has_one :recent_post, :order => "#{Post.table_name}.created_at DESC", :class_name => 'Post'

  has_many :posts,       :order => "#{Post.table_name}.created_at DESC", :dependent => :delete_all
  
    # this is used to see if a forum is "fresh"... we can't use topics because it puts
  # stickies first even if they are not the most recently modified
  has_many :recent_topics, :class_name => 'Topic', :include => [:user],
    :order => "#{Topic.table_name}.last_updated_at DESC",
    :conditions => ["users.state = ?", "active"]
  has_one :recent_topic, :class_name => 'Topic', :order => "#{Topic.table_name}.last_updated_at DESC"
  
end
