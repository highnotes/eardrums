FactoryGirl.define do
  factory :batch do
    status "Active"
    discipline
    teacher
    day 6
    start_time Time.now
    duration 60
    created_by 1
    modified_by 1
  end
end
