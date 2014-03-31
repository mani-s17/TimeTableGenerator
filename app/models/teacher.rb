class Teacher < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  validates :teaching_hours, presence: true, inclusion: 1..40
end