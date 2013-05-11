class StudyController < ApplicationController
  def index
    @courses = Course.order(:user_number) #사용자순 출력
    @user = User.find(1)
    #@subscribe = @user.courses
    course_ids = Subscribe.where(:user_id => 1, :activated => true).map{|x| x.course_id}
    @subscribe = Course.find_all_by_id(course_ids)

  end

  def subscribe
    if(s = Subscribe.where(:user_id => 1, :course_id => params[:id]).empty?)
      subscribe = Subscribe.new
      subscribe.user_id = 1 #session_id
      subscribe.course_id = params[:id]
      subscribe.activated = true
      subscribe.save
    else
      sub = Subscribe.where(:user_id => 1, :course_id => params[:id]).first
      sub.activated = true
      sub.save
    end
    redirect_to '/study/index'
  end

  def unsubscribe
    del = Subscribe.where(:user_id => 1, :course_id => params[:id]).first
    del.activated = false
    del.save
    redirect_to '/study/index'
  end
end
