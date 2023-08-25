class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_author_posts_counter
  after_destroy :decrement_author_posts_counter

  after_create :update_likes_counter, :update_comments_counter
  after_destroy :update_likes_counter, :update_comments_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_author_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_author_posts_counter
    author.decrement!(:posts_counter)
  end

  def update_likes_counter
    update(likescounter: likes.count)
  end

  def update_comments_counter
    update(commentscounter: comments.count)
  end
end
