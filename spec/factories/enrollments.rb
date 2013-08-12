FactoryGirl.define do
  factory :enrollment do
    application_no "10113423422-1"
    membership_no "ED0000001"
    branch
    course
    batch
    student
    name "John Doe"
    address "Address"
    phone "+91-9880592342"
    sequence(:email) { |n| "john.doe#{n}@example.com" }
    enrolled_on "2013-08-12"
    duration 8
    status "Active"
    registration_fee "500"
    course_fee "2400"
    total "2900"
    mode "Card"
    details "9923"
    created_by 1
    modified_by 1
    txn_status "Active"
    reversal_reason_id 0
    date_of_birth "2013-08-12"
    gender "Male"
    experience nil
    additional_courses nil
    source_id 1
  end
end
