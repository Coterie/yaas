class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_page
    @page ||= [1, params[:page].to_i].max
  end
end
