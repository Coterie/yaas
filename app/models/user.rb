class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
 include User::Posting

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :posts, :order => "#{Post.table_name}.created_at desc"
  has_many :topics, :order => "#{Topic.table_name}.created_at desc"

  has_many :moderatorships, :dependent => :delete_all
  has_many :forums, :through => :moderatorships, :source => :forum do
    def moderatable
      select("#{Forum.table_name}.*, #{Moderatorship.table_name}.id as moderatorship_id")
    end
  end

  has_many :monitorships, :dependent => :delete_all
  has_many :monitored_topics, :through => :monitorships, :source => :topic, :conditions => {"#{Monitorship.table_name}.active" => true}

  def moderator_of?(forum)
    !!(admin? || Moderatorship.exists?(:user_id => id, :forum_id => forum.id))
  end
  
end
