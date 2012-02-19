class Topic < ActiveRecord::Base
 include User::Editable  

attr_accessor :body

before_validation :set_default_attributes, :on => :create
after_create   :create_initial_post

has_many :posts , dependent: :destroy
belongs_to :forum
belongs_to :user
validates_presence_of :title
belongs_to :last_user, :class_name => "User"

has_many :voices, :through => :posts, :source => :user, :uniq => true

has_one  :recent_post, :order => "#{Post.table_name}.created_at DESC", :class_name => "Post"

has_many :monitorships, :dependent => :delete_all
has_many :monitors, :through => :monitorships, :conditions => ['monitorships.active = ?', true], :source => :user

def paged?
    posts_count > Post.per_page
end

def last_page
    [(posts_count.to_f / Post.per_page.to_f).ceil.to_i, 1].max
end

def set_default_attributes
  self.last_updated_at ||= Time.now.utc
end

def create_initial_post
      user.reply self, @body # unless locked?
      @body = nil
end

end
