module Permissions
  class StaffPermission < BasePermission
    def initialize(user)
      allow_action "devise/sessions", [:all]
      allow_action "devise/confirmations", [:all]
      allow_action "users/registrations", [:new, :create, :edit, :update, :destroy, :cancel]
      allow_action "users/omniauth_callbacks", [:all]
      allow_action "static_pages", [:all]
      allow_action "devise/passwords", [:new, :create, :edit, :update]
      allow_action "courses", [:index, :show]
      allow_action "enrollments", [:new, :create, :edit, :update, :show, :index, :reverse]
      allow_action "payments", [:index]
      allow_action "teachers", [:new, :create, :edit, :update, :show, :index]
    end
  end
end