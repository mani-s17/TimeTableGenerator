# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_subject do
    class_group
    subject
    hours_required Random.rand(1..10)
  end
end
