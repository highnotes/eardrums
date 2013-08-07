# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :branch do
    name "Whitefield"
    subdomain "wf"
    status "Active"
    opened_on "2013-07-31"
    email "fo@wf.eardrums.in"
    address "Varthur Main Road"
    city "Bangalore"
    state "Karnataka"
    country "India"
    phones "+91-80-23442234"
    franchise_id 1
    closed_on ""
  end
end
