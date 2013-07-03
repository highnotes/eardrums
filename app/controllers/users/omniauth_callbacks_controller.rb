class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    auth = request.env['omniauth.auth']
    @identity = Identity.from_omniauth(auth)
    
    if signed_in? || @identity.user.present?
      user = current_user || @identity.user
      user.update_from_omniauth(auth)
      sign_in_and_redirect user
    else
      user = User.create_from_omniauth(auth)
      if user.persisted?
        flash.notice = "Signed in!"
        sign_in_and_redirect user
      else
        session["devise.user_attributes"] = user.attributes
        session["devise.user_identity"] = @identity.id
        redirect_to new_user_registration_url, notice: "Please finish registering!"
      end
    end
  end
  alias_method :twitter, :all
  alias_method :facebook, :all
  alias_method :google_oauth2, :all
end
