FactoryGirl.define do
  factory :identity do
    uid "1234567890"
    provider "twitter"
    user nil
  end
  
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "john.doe@example.com"
    password "johndoe123"
    
    factory :omniauth_user do
      email "john.not.doe@example.com"
      after(:create) do |user|
        FactoryGirl.create(:identity, user: user)
      end
    end
  end
end
