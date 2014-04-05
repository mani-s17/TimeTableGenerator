class SubjectStandard < ActiveRecord::Base
  belongs_to :subject
  belongs_to :standard

  validates :subject, presence: true
  validates :standard, presence: true
end
