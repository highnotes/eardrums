FactoryGirl.define do
  factory :identity do
    uid "1234567890"
    provider "twitter"
    user nil
  end
  
  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence(:email) { |n| "john.doe#{n}@example.com" }
    
    password "johndoe123"
    role "user"
    sequence(:username) { |n| "johndoe#{n}" }
    
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
      course
      
      factory :student_without_course do
        course nil
      end
    end
    
    factory :staff do
      role "staff"
      branch_id 1
    end
  end
end
