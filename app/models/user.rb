class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :study_times
  has_many :recommends
  has_many :recommend_comments
  has_many :favorites
  has_many :relationships
  has_many :following, through: :relationships, source: :following #自分がフォローしている
  has_many :followed, through: :relationships, source: :followed　#自分がフォローされている
  
  attachment :profile_image

  def follow(other_user) #フォローする
  unless self == other_user
    self.relationships.find_or_create_by(follow_id: other_user.id)
  end
end
end
