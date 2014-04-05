# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :standard do
    sequence(:name) { |n| "Standard#{n}" }
  end
end
