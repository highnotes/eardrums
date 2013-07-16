class CoursesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]
  
  def index
    @disciplines = Discipline.all
  end
  
  private
    def permitted_params
      params.permit!
    end
end