class StudyTime < ApplicationRecord
  belongs_to :user

  validates :min, presence: true
  validates :comment, presence: true
end
