FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "john.doe@example.com"
    password "johndoe123"
  end
end