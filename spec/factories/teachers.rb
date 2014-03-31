# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    sequence(:name) { |n| "Teacher #{n}" }
    teaching_hours Random.rand(10)
  end
end
