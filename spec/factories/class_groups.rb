# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_group do
    sequence(:name) { |n| "Group #{n}" }
    standard
    size Random.rand(40)

    factory :class_group_with_subjects do

      ignore do
        hours 4
        subjects ['PHY', 'CHEM', 'MAT']
      end

      after(:create) do |class_group, evaluator|
        evaluator.subjects.each do |subject_code|
          create(:group_subject_with_code, class_group: class_group, hours_required: evaluator.hours, code: subject_code)
        end
      end
    end

  end
end
