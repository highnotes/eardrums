class StaffsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]
  
  def index
    @staff = Staff.all
  end
  
  def show
    @staff = Staff.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => @staff }
    end
  end
  
  private
  
  def staff_params
    params.require(:staff).permit!
  end
end