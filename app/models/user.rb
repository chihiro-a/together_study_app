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
  has_many :follower, class_name:"Relationship", foreign_key: "following_id", dependent: :destroy #フォローする際必要な記述
  has_many :followed, class_name:"Relationship", foreign_key: "followed_id", dependent: :destroy #フォローされる際必要な記述？
  has_many :following_user, through: :follower, source: :followed #自分がフォローしている
  has_many :followed_uesr, through: :followed, source: :follower #自分がフォローされている
  has_many :posts

  attachment :profile_image

  def follow(user) #フォローする。other_user = paramsで取得するフォローしたいユーザー
    # unless self == user #フォローしたい相手が自分ではないか？
    #   follower.create(followed_id: user.id)
    # end
    follower.create(followed_id: user)
  end

  def unfollow(other_user) #フォローを外す
    target_relationship = follower.find_by(followed_id: other_user)
    target_relationship.destroy if target_relationship
  end

  def following?(user) #フォローしているかどうかの確認
    following_user.include?(user)
  end

end
