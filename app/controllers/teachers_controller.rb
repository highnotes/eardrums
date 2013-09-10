class TeachersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]
  
  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params.merge(created_by: current_user.id, modified_by: current_user.id))
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to root_url, notice: 'Successfully created!' }
        format.json { render action: 'show', status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @teacher = Teacher.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => @teacher }
    end
  end
  
  private
  
  def teacher_params
    params.require(:teacher).permit!
  end
end