class EnrollmentsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    params[:q] ||= Hash.new.merge(enrolled_on_gteq: Date.today, enrolled_on_lteq: Date.today)
    @enrolled_on_gteq = params[:q][:enrolled_on_gteq]
    @enrolled_on_lteq = params[:q][:enrolled_on_lteq]
    @q = Enrollment.search(params[:q])
    @enrollments = @q.result(distinct: true)
  end
  
  def new
    @enrollment = Enrollment.new
    @enrollment.student = User.new
    @disciplines = Discipline.all
    @branches = Branch.all
  end
  
  def create
    @enrollment = Enrollment.build(enrollment_params.merge(created_by: current_user.id, modified_by: current_user.id))
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to root_url, notice: 'Successfully enrolled!' }
        format.json { render action: 'show', status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def enrollment_params
    params.require(:enrollment).permit!
  end
end