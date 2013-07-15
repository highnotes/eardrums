class Users::InvitationsController < Devise::InvitationsController
  before_filter :configure_permitted_parameters
  
   # GET /resource/invitation/accept?invitation_token=abcdef
  def edit
    render :edit
  end
 
  # PUT /resource/invitation
  def update
    self.resource = resource_class.accept_invitation!(devise_parameter_sanitizer.for(:accept_invitation))
 
    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active                                                                                        
      set_flash_message :notice, flash_message
      sign_in(resource_name, resource)
 
      redirect_to edit_user_registration_path, :alert => "Please fill out your profile details." 
    else
      respond_with_navigational(resource){ render :edit, :layout => false }
    end
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:invitation_token, :password, :password_confirmation)
    end
  end
end