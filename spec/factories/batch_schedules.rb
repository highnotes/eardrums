# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batch_schedule do
    batch
    status "Scheduled"
    scheduled_on "2014-08-07"
  end
end
