FactoryGirl.define do
  sequence :email do |n|
    "john.doe#{n}@example.com"
  end
  
  sequence :username do |n|
    "johndoe#{n}"
  end
    
  factory :identity do
    uid "1234567890"
    provider "twitter"
    user nil
  end
  
  factory :user do
    first_name "John"
    last_name  "Doe"
    email
    password "johndoe123"
    role "user"
    username
    
    factory :omniauth_user do
      after(:create) do |user|
        FactoryGirl.create(:identity, user: user)
      end
    end
    
    factory :admin do
      first_name "Admin"
      last_name  "User"
      password "admin"
      role "admin"
    end
    
    factory :teacher do
      role "teacher"
    end
    
    factory :student do
      role "student"
      
      factory :student_with_course do
        course
      end
    end
    
    factory :staff do
      role "staff"
      branch_id 1
    end
  end
end
