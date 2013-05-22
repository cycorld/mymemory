class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_my_lectures
  def load_my_lectures
    course_ids = Subscribe.where(:user_id => session[:user_id], :activated => true).map{|x| x.course_id}
    @subscribe = Course.find_all_by_id(course_ids)
  end 
end
