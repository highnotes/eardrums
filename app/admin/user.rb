ActiveAdmin.register User do
  config.clear_action_items! # To clear "New User" link
  
  index do
    column :email
    column :last_sign_in_at
    column :username
    column :first_name
    column :last_name
    column :role
    default_actions
  end
  
  filter :email
  filter :username
  filter :first_name
  filter :last_name
  filter :role
  filter :invited_by_type
  
  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :role
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
  	@user = User.invite!(params[:user], current_user)
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
