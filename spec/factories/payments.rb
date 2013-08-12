# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    mode "Cash"
    transaction_type "Enrollment"
    registration_fee "500"
    course_fee "2400"
    total "2900"
    narration "Cash Payment"
    status "Active"
    created_by 1
    modified_by 1
  end
end
