class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user!
  before_filter :authorize
  
  delegate :allow_action?, to: :current_permission
  helper_method :allow_action?
  
  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?
  
  private
    def current_permission
      @current_permission ||= ::Permissions.permission_for(current_user)
    end
    
    def current_resource
      nil
    end
  
    def authorize
      if current_permission.allow_action?(params[:controller], params[:action], current_resource)
        current_permission.permit_params! params
      else
        puts "Failed Authorization:: Controller: #{params[:controller]} - Action: #{params[:action]}"
        redirect_to root_url, alert: "Not authorized."
      end
    end
end
