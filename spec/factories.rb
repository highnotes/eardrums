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
    role "user"
    sequence(:username) { |n| "johndoe_#{n}_user" }
    
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
      sequence(:username) { |n| "johndoe_#{n}_admin" }
      sequence(:email) { |n| "john.doe#{n}@admin.com" }
    end
    
    factory :teacher do
      role "teacher"
      sequence(:username) { |n| "johndoe_#{n}_teacher" }
      sequence(:email) { |n| "john.doe#{n}@teacher.com" }
    end
    
    factory :student do
      role "student"
      sequence(:username) { |n| "johndoe_#{n}_student" }
      sequence(:email) { |n| "john.doe#{n}@student.com" }
      course
      
      factory :student_without_course do
        sequence(:username) { |n| "johndoe_#{n}_student2" }
        sequence(:email) { |n| "john.doe#{n}@student2.com" }
        course nil
      end
    end
    
    factory :staff do
      role "staff"
      sequence(:username) { |n| "johndoe_#{n}_staff" }
      sequence(:email) { |n| "john.doe#{n}@staff.com" }
      branch_id 1
    end
  end
end
