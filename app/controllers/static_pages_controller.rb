class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def home
  end
  
  def terms
  end
  
  def contact_us
  end
end
