# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    sequence(:name) {|n| "Subject #{n}"}
    sequence(:code) {|n| "Sub#{n}"}
  end
end
