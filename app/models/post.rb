class Post < ActiveRecord::Base

include User::Editable  

belongs_to :user 
belongs_to :topic 
belongs_to :forum
validates_presence_of :body

  def paged?
    posts_count > Post.per_page
  end

end
