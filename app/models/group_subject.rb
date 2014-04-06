class GroupSubject < ActiveRecord::Base
  belongs_to :class_group
  belongs_to :subject

  validates :class_group, presence: true
  validates :subject, presence: true
  validates :hours_required, presence: true, inclusion: 1..20
end
