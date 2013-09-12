FactoryGirl.define do
  factory :staff do
    first_name "John"
    last_name  "Doe"    
    password "johndoe123"
    type "Staff"
    sequence(:username) { |n| "johndoe_#{n}_staff" }
    sequence(:email) { |n| "john.doe#{n}@staff.com" }
    branch
  end
end