class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  alias_attribute :author, :user

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
