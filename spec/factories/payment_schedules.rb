# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment_schedule do
    enrollment
    due_on 4.weeks.from_now
    status "Unpaid"
    payment
    created_by 1
    modified_by 1
  end
end
