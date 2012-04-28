# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    participant_id 1
    d_know_astro 1
    d_know_psyc 1
    t_know_astro 1
    t_know_psyc 1
    d_interest_astro 1
    d_interest_psyc 1
    t_interest_astro 1
    t_interest_psyc 1
    confidence_discrete 1
    confidence_open 1
    answer_discrete "MyText"
    answer_open "MyText"
    confidencewhy_discrete "MyText"
    confidencewhy_open "MyText"
  end
end
