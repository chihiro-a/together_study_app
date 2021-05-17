class RecommendComment < ApplicationRecord
  belongs_to :user
  belongs_to :recommend
end
