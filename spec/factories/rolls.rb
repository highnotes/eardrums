FactoryGirl.define do
  factory :roll do
    student
    course
    branch
    duration 8
    attended 0
    to_end_on 8.weeks.from_now
    ended_on nil
  end
end
