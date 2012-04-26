# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participant do
    session_id "MyString"
    ip_address "MyString"
    first_name "MyString"
    last_name "MyString"
    instructor "MyString"
    country "MyString"
  end
end
