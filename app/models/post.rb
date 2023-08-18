class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  alias_attribute :author, :user

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
