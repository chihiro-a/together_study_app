class Recommend < ApplicationRecord
  belongs_to :user
  has_many :recommend_comments
end
