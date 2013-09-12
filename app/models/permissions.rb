module Permissions
  def self.permission_for(user)
    if user.nil?
      GuestPermission.new
    elsif user.admin?
      AdminPermission.new(user)
    elsif user.staff?
      StaffPermission.new(user)
    elsif user.student?
      StudentPermission.new(user)
    elsif user.teacher?
      TeacherPermission.new(user)
    else
      ap user
    end
  end
end