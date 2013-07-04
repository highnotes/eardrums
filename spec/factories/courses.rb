# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "Beginner - Carnatic"
    description "Beginner - Carnatic"
    duration 8
    price "1500"
    status "Active"
    
    level
    discipline
  end
end
