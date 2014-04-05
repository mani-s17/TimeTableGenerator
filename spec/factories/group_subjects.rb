# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_subject do
    class_group
    subject
  end
end
