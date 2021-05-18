class Recommend < ApplicationRecord
  belongs_to :user
  has_many :recommend_comments
  has_many :favorites
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
