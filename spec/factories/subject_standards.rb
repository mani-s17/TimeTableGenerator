# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject_standard do
    subject
    standard

    factory :subject_standard_with_code do
      ignore do
        code nil
      end

      before(:create) do |subject_standard, evaluator|
        subject_standard.subject.name=evaluator.code
        subject_standard.subject.code=evaluator.code
        subject_standard.subject.save
      end
    end
  end
end
