class StudyController < ApplicationController
  def index
    @courses = Course.order(:user_number) #사용자순 출력
  end

end
