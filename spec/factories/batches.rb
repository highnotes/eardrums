FactoryGirl.define do
  factory :batch do
    status "Active"
    discipline
    teacher
    day "Sunday"
    start_time "14:30"
    duration 60
    created_by 1
    modified_by 1
  end
end
