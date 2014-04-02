class ClassGroup < ActiveRecord::Base
  belongs_to :standard
  validates :name, presence: true
  validates :size, presence: true, inclusion: 1..100
  validates :standard, presence: true
end
