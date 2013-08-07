# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student_schedule do
    student
    batch_schedule
    attended_on "2012-08-07"
  end
end
