module User::Posting
  def reply(topic, body)
    topic.posts.build(:body => body).tap do |post|
     ## post.site = topic.site
      post.forum = topic.forum
      post.user = self
      post.save
    end
  end
end