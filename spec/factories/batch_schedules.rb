# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batch_schedule do
    batch
    status "Active"
    scheduled_on Date.today
  end
end
