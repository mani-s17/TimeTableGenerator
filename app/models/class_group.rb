class ClassGroup < ActiveRecord::Base
  belongs_to :standard
  has_many :group_subjects
  has_many :subjects, through: :group_subjects

  validates :name, presence: true
  validates :size, presence: true, inclusion: 1..100
  validates :standard, presence: true
end
