# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    sequence(:name) { |n| "Teacher #{n}" }
    teaching_hours Random.rand(10)

    # teacher_subject_standards will create data after the teacher has been created
    factory :teacher_with_subjects do

      # Ignored attribute and available to be used in creation
      ignore do
        standards 2
        subjects ['PHY', 'CHEM', 'MAT']
      end

      # the after(:create) yields two values; the teacher instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes;
      after(:create) do |teacher, evaluator|
        evaluator.standards.times do
          standard = create(:standard)
          evaluator.subjects.each do |subject_code|
            subject_standard = create(:subject_standard_with_code, standard: standard, code: subject_code)
            create(:teacher_subject_standard, teacher: teacher, subject_standard: subject_standard)
          end
        end
      end
    end
  end
end
