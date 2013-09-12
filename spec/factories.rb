FactoryGirl.define do
  factory :identity do
    uid "1234567890"
    provider "twitter"
    user nil
  end
  
  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence(:email) { |n| "john.doe#{n}@user.com" }
    
    password "johndoe123"
    type "User"
    sequence(:username) { |n| "johndoe_#{n}_user" }
    
    factory :omniauth_user do
      after(:create) do |user|
        FactoryGirl.create(:identity, user: user)
      end
    end
  end
end
