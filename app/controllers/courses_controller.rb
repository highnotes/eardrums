class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def edit
    @course = Course.find(params[:id])
  end
end