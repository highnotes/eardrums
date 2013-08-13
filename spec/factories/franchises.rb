# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :franchise do
    name "New World Music"
    franchisees "John Doe"
    emails "john.doe@example.com"
    phones "9999999999"
    address "Address of New World Music"
    city "Bangalore"
    state "Karnataka"
    country "India"
    created_by 1
    modified_by 1
  end
end
