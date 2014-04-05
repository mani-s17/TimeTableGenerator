class GroupSubject < ActiveRecord::Base
  belongs_to :class_group
  belongs_to :subject

  validates :class_group, presence: true
  validates :subject, presence: true
end
