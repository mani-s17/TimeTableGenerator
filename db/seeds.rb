# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namespace :db do
  task seed: :environment do
    rand = Random.new(Time.now.to_i)
    #Base entities
    5.times { FactoryGirl.create(:teacher, teaching_hours: rand.rand(10..20)) }
    5.times { FactoryGirl.create(:subject) }
    3.times { FactoryGirl.create(:standard) }

    #Linkings
    Standard.all.each do |standard|
      4.times { |n| FactoryGirl.create(:class_group, name: "CG#{n}", standard: standard, size: rand.rand(25..40)) }
    end

    ClassGroup.all.each do |group|
      Subject.all.each do |subject|
        FactoryGirl.create(:group_subject, class_group: group, subject: subject, hours_required: rand.rand(1..10))
      end
    end

    Standard.all.each do |standard|
      Subject.all.each do |subject|
        FactoryGirl.create(:subject_standard, standard: standard, subject: subject)
      end
    end

    Teacher.all.each do |teacher|
      SubjectStandard.all.each do |subject_standard|
        FactoryGirl.create(:teacher_subject_standard, teacher: teacher, subject_standard: subject_standard)
      end
    end

  end
end