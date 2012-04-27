# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :demographic do
    participant_id 1
    gender 1
    age 1
    ethnicity "MyString"
    major "MyString"
    year_university 1
    gpa 1.5
    country_of_residence "MyString"
    country_of_birth "MyString"
    country_of_schooling "MyString"
    native_english false
    native_language "MyString"
  end
end
