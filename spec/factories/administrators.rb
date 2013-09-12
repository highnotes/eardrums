FactoryGirl.define do
  factory :administrator do
    first_name "Admin"
    last_name  "User"
    password "password"
    type "Administrator"
    sequence(:username) { |n| "johndoe_#{n}_admin" }
    sequence(:email) { |n| "john.doe#{n}@admin.com" }
  end
end