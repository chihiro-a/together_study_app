class RecommendComment < ApplicationRecord
  belongs_to :user
  belongs_to :recommend

  validates :recommend_comment, presence: true
end
