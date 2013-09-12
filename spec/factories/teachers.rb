FactoryGirl.define do
  factory :teacher do
    first_name "John"
    last_name  "Doe"    
    password "johndoe123"
    type "Teacher"
    sequence(:username) { |n| "johndoe_#{n}_teacher" }
    sequence(:email) { |n| "john.doe#{n}@teacher.com" }
  end
end