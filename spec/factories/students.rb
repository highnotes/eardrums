FactoryGirl.define do
  factory :student do
    name "John Doe"
    password "johndoe123"
    type "Student"
    sequence(:username) { |n| "johndoe_#{n}_student" }
    sequence(:email) { |n| "john.doe#{n}@student.com" }
    course
    branch
  
    factory :student_without_course do
      sequence(:username) { |n| "johndoe_#{n}_student2" }
      sequence(:email) { |n| "john.doe#{n}@student2.com" }
      course nil
    end
  end
end
