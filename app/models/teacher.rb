class Teacher < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  validates :teaching_hours, presence: true, inclusion: 1..40

  has_many :teacher_subject_standards
  has_many :subject_standards, through: :teacher_subject_standards
end