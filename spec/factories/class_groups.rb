# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_group do
    sequence(:name) { |n| "Group #{n}" }
    standard_id Random.rand(10)
    size Random.rand(40)
  end
end
