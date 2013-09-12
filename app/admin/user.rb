ActiveAdmin.register User do
  # TODO Refer to TYPES variable within User model
  TYPES = %w[Administrator Teacher Staff Student]
  
  config.clear_action_items! # To clear "New User" link
  
  index do
    column :email
    column :last_sign_in_at
    column :username
    column :name
    column :type
    default_actions
  end
  
  filter :email
  filter :username
  filter :name
  filter :type
  filter :invited_by_type
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
  
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :type, as: :select, collection: TYPES
      f.input :branch
      f.input :invitation_limit
    end
    f.actions
  end
  
  action_item do
    link_to 'Invite New User', new_invitation_admin_users_path
  end
 
  collection_action :new_invitation do
  	@user = User.new
  end 
 
  collection_action :send_invitation, :method => :post do
  	@user = User.invite!(params[:user].merge(confirmed_at: Time.now, skip_invitation: true), current_user)
  	if @user.errors.empty?
  		flash[:success] = "User has been successfully invited." 
  		redirect_to admin_users_path
  	else
  		messages = @user.errors.full_messages.map { |msg| msg }.join
  		flash[:error] = "Error: " + messages
  		redirect_to new_invitation_admin_users_path
  	end
  end
end
