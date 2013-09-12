class StudentsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:show]
  
  def index
    @q = Student.search(params[:q])
    @students = @q.result(distinct: true)
  end
  
  def show
    @student = Student.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => @student }
    end
  end
  
  private
  
  def student_params
    params.require(:student).permit!
  end
end