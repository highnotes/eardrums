# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :installment do
    course
    index 1
    no_of_installments 2
    interval 4
    amount "1200"
    created_by 1
    modified_by 1
  end
end
