class StudyController < ApplicationController
  def index
    @courses = Course.order(:user_number) #사용자순 출력
    #@user = User.find(1)
    #@subscribe = @user.courses
    @last_card = 0
  end

  def list


  end

  def subscribe
    if session[:user_id] == nil
      redirect_to :root
    else
      if(s = Subscribe.where(:user_id => session[:user_id], :course_id => params[:id]).empty?)
        subscribe = Subscribe.new
        subscribe.user_id = session[:user_id] #session_id
        subscribe.course_id = params[:id]
        subscribe.activated = true
        subscribe.save
        #memoris 생성
        cards = Card.where(:course_id => params[:id])
        cards.each do |card|
          memory = Memory.new
          memory.course_id = params[:id]
          memory.user_id = session[:user_id]
          memory.card_id = card.id
          memory.grade = 1
          memory.know = 0
          memory.dont_know = 0
          memory.save
        end
        #사용 유저 수 증가
        course = Course.find_by_id(params[:id])
        course.user_number += 1
        course.save
      else
        sub = Subscribe.where(:user_id => session[:user_id], :course_id => params[:id]).first
        sub.activated = true
        sub.save
      end
      redirect_to '/study/index'
    end
  end

  def unsubscribe
    del = Subscribe.where(:user_id => session[:user_id], :course_id => params[:id]).first
    del.activated = false
    del.save
    redirect_to '/study/index'
  end

  def view
    card_id = params[:card_id]
    if card_id == "0"
      temp = Memory.where(:user_id => session[:user_id], :course_id => params[:id]).last
      card_id = temp.card_id
    end
    @mem = Memory.where(:user_id => session[:user_id], :course_id => params[:id], :card_id => card_id).first
    @view_card = Card.find_by_id(@mem.card_id)
    total = @mem.know + @mem.dont_know
    if total != 0
      @know = (( @mem.know.to_f / total ) * 100).to_i
      @dont_know = 100 - @know
      @dont_see = 0
    else
      @know = 0
      @dont_know = 0
      @dont_see = 100
    end
    grades = Memory.grade_array(session[:user_id], params[:id])
    @myhead = grades
    grades_total = grades[0]+grades[1]+grades[2]+grades[3]+grades[4]
    @grade_one = 100 * grades[0] / grades_total
    @grade_two = 100 * grades[1] / grades_total
    @grade_three = 100 * grades[2] / grades_total
    @grade_four = 100 * grades[3] / grades_total
    @grade_five = 100 * grades[4] / grades_total
    @score = (@grade_five + @grade_four*0.9 + @grade_three*0.7 + @grade_two*0.4).to_i
    
  end

  def know
    mem = Memory.find_by_id(params[:id])
    mem.know = mem.know + 1
    if (mem.grade < 5)
      mem.grade = mem.grade + 1
    end
    mem.save
    memories = Memory.where(:user_id => session[:user_id], :course_id => mem.course_id).order("updated_at").first
    redirect_to :action => "view", :id => mem.course_id, :card_id => memories.card_id
  end

  def dont_know
    mem = Memory.find_by_id(params[:id])
    mem.dont_know += 1
    if (mem.grade > 1)
      mem.grade = 1
    end
    mem.save
    memories = Memory.where(:user_id => session[:user_id], :course_id => mem.course_id).order("updated_at").first
    redirect_to :action => "view", :id => mem.course_id, :card_id => memories.card_id
  end

end
