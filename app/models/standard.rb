class Standard < ActiveRecord::Base
  validates :name, presence: true
  has_many :class_groups, dependent: :destroy
end
