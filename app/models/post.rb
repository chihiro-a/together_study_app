class Post < ApplicationRecord
  attachment :image
  belongs_to :user

  validates :body, presence: true
end
