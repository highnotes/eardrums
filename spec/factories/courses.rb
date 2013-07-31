# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "Intro to Guitar"
    description "Introduction to Guitar"
    duration 8
    price "1500"
    status "Active"
    code "C0001"
    index 1
    
    level
    discipline
    teacher
  end
end
