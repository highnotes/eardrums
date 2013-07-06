class CoursesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]
  
  def index
    @courses = Course.all
  end
  
  def edit
    @course = Course.find(params[:id])
  end
end