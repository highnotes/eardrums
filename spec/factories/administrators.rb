FactoryGirl.define do
  factory :administrator do
    name "Admin User"
    password "password"
    type "Administrator"
    sequence(:username) { |n| "johndoe_#{n}_admin" }
    sequence(:email) { |n| "john.doe#{n}@admin.com" }
  end
end