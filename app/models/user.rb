class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy

  def most_recent_posts(max = 3)
    posts.order(created_at: :desc).limit(max)
  end
end
