# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do
    name "Early Elementary"
    description "Early Elementary"
    sequence(:index) {|n| 200000+n }
  end
end
