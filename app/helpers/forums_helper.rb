module ForumsHelper
  
  def recent_topic_activity(topic)
    return false if not user_signed_in?
    return false unless last_active || session[:topics]
    
    return topic.replied_at > (last_active || session[:topics][topic.id])
  end
  
  # used to know if a forum has changed since we read it last
  def recent_forum_activity(forum)
    return false unless user_signed_in? && forum.topics.first
    return false unless last_active || session[:forums]
     
    return forum.topics.order("replied_at desc").first.replied_at > (last_active || session[:forums][forum.id])
  end
  
end
