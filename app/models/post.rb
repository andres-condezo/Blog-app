class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments(max = 5)
    comments.order(created_at: :desc).limit(max)
  end
end
