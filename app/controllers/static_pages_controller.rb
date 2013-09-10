class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def home
    ids = Course.where(index: 1).pluck(:id).shuffle[0..3]
    @courses = Course.where(id: ids).shuffle
  end
  
  def terms
  end
  
  def contact_us
  end
end
