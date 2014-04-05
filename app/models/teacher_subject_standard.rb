class TeacherSubjectStandard < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject_standard

  validates :teacher, presence: true
  validates :subject_standard, presence: true
end
