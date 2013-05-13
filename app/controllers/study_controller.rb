class StudyController < ApplicationController
  def index
    @courses = Course.order(:user_number) #사용자순 출력
    @user = User.find(1)
    #@subscribe = @user.courses
    course_ids = Subscribe.where(:user_id => session[:user_id], :activated => true).map{|x| x.course_id}
    @subscribe = Course.find_all_by_id(course_ids)
    @last_card = 0

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
    @subscribe = Memory.where(:user_id => session[:user_id], :course_id => params[:id], :card_id => card_id).first
    @view_card = Card.find_by_id(@subscribe.card_id)
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
      mem.grade -= 1
    end
    mem.save
    memories = Memory.where(:user_id => session[:user_id], :course_id => mem.course_id).order("updated_at").first
    redirect_to :action => "view", :id => mem.course_id, :card_id => memories.card_id
  end

end
