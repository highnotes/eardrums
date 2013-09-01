# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    mode "Cash"
    registration_fee "500"
    course_fee "2400"
    total "2900"
    narration "Cash Payment"
    status "Active"
    branch
    created_by 1
    modified_by 1
    transactable { |a| a.association(:enrollment) }
  end
end
