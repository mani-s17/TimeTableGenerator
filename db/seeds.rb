# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namespace :db do
  task seed: :environment do

    #Base entities
    5.times { FactoryGirl.create(:teacher) }
    5.times { FactoryGirl.create(:subject) }
    3.times { FactoryGirl.create(:standard) }

    #Linkings
    Standard.all.each do |standard|
      4.times { |n| FactoryGirl.create(:class_group, name: "CG#{n}", standard: standard) }
    end

    ClassGroup.all.each do |group|
      Subject.all.each do |subject|
        FactoryGirl.create(:group_subject, class_group: group, subject: subject)
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