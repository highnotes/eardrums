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
    username "johndoe"
    
    factory :omniauth_user do
      email "john.not.doe@example.com"
      after(:create) do |user|
        FactoryGirl.create(:identity, user: user)
      end
    end
    
    factory :admin do
      first_name "Admin"
      last_name  "User"
      email "admin@example.com"
      password "admin"
      role "admin"
    end
    
    factory :teacher do
      email "teacher.1@eardrums.in"
      username "teacher.1"
      role "teacher"
    end
    
    factory :student do
      email "student.1@eardrums.in"
      username "student.1"
      role "student"
      
      factory :student_with_course do
        course
      end
    end
    
    factory :staff do
      email "staff.1@eardrums.in"
      username "staff.1"
      role "staff"
      branch_id 1
    end
  end
end
