# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batch do
    status "Active"
    discipline
    teacher
    day 6
    start_time Time.now
    duration 60
  end
end
