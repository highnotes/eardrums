class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    auth = request.env['omniauth.auth']
    puts "Auth: #{auth}"
    # Find an identity here
    # If no identity was found, a brand new one will be created
    @identity = Identity.from_omniauth(auth)

    if signed_in?
      if @identity.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it 
        # is the current user. So the identity is already associated with 
        # this user. So let's display an error message.
        User.update_from_omniauth(auth) #Update user attributes if any
        redirect_to root_url, notice: "Already linked!"
      else
        # The identity is not associated with the current_user so lets 
        # associate the identity
        @identity.update_attributes(user_id: current_user.id)
        User.update_from_omniauth(auth) #Update attributes if any
        redirect_to root_url, notice: "Successfully linked Identity!"
      end
    else
      if @identity.user.present?
        User.update_from_omniauth(auth) #Update attributes if any
        sign_in_and_redirect @identity.user
      else
        # No user associated with the identity so we need to create a new one
        # This user may be a duplicate, but the assumption is that the user 
        # wants to create a new profile for himself because he hasnt yet logged in
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
  end
  alias_method :twitter, :all
  alias_method :facebook, :all
  alias_method :google_oauth2, :all
end
