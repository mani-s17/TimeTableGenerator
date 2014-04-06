# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_subject do
    class_group
    subject
    hours_required Random.rand(1..10)

    factory :group_subject_with_code do
      ignore do
        code nil
      end

      before(:create) do |group_subject, evaluator|
        group_subject.subject.name=evaluator.code
        group_subject.subject.code=evaluator.code
        group_subject.subject.save
      end
    end
  end
end
