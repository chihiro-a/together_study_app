class Recommend < ApplicationRecord
  belongs_to :user
  has_many :recommend_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :outher, presence: true
  validates :publisher, presence: true
  validates :body, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
