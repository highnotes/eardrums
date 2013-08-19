module Permissions
  def self.permission_for(user)
    if user.nil?
      GuestPermission.new
    elsif user.admin?
      AdminPermission.new(user)
    elsif user.staff?
      StaffPermission.new(user)
    else
      UserPermission.new(user)
    end
  end
end