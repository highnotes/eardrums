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
    role "user"
    
    factory :omniauth_user do
      email "john.not.doe@example.com"
      after(:create) do |user|
        FactoryGirl.create(:identity, user: user)
      end
    end
    
    factory :admin_user do
      first_name "Admin"
      last_name  "User"
      email "admin@example.com"
      password "admin"
      role "admin"
    end
  end
end
