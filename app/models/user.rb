class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
