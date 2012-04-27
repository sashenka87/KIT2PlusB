# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :graphic do
    participant_id 1
    graphics_ki 1
    graphics_ki_text "MyText"
    graphics_kt 1
    graphics_kt_text "MyText"
    graphics_it 1
    graphics_it_text "MyText"
    k_def "MyText"
    i_def "MyText"
    t_def "MyText"
    kit "MyText"
    context "MyText"
    domain "MyText"
  end
end
