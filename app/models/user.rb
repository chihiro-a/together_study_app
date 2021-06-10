class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :study_times, dependent: :destroy
  has_many :recommends, dependent: :destroy
  has_many :recommend_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships
  has_many :follower, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy # フォローする際必要な記述
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォローされる際必要な記述？
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている
  has_many :followed_uesr, through: :followed, source: :follower # 自分がフォローされている
  has_many :posts, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true

  def follow(user) # フォローする。other_user = paramsで取得するフォローしたいユーザー
    follower.create(followed_id: user)
  end

  def unfollow(user) # フォローを外す
    target_relationship = follower.find_by(followed_id: user)
    target_relationship.destroy if target_relationship
  end

  def following?(user) # フォローしているかどうかの確認
    following_user.include?(user)
  end
end
