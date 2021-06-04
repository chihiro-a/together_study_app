class Recommend < ApplicationRecord
  belongs_to :user
  has_many :recommend_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
