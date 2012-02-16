module ApplicationHelper
  def last_active
    session[:last_active] ||= Time.now.utc
  end
  
  def feed_icon_tag(title, url)
    (@feed_icons ||= []) << { :url => url, :title => title }
    link_to image_tag('feed-icon.png', :size => '14x14', :alt => I18n.t('txt.subscribe_to_feed', :default => "Subscribe to %{title}", :title => title)), url
  end

  
   def topic_title_link(topic, options) 
    if topic.title =~ /^\[([^\]]{1,15})\]((\s+)\w+.*)/ 
      "<span class='flag'>#{$1}</span>" +  
      link_to($2.strip, forum_topic_path(@forum, topic), options) 
    else 
      link_to(topic.title, forum_topic_path(@forum, topic), options) 
    end 
  end 

   def ajax_spinner_for(id, spinner="spinner.gif")
    "<img src='/images/#{spinner}' style='display:none; vertical-align:middle;' id='#{id.to_s}_spinner'> ".html_safe
  end

  
end
