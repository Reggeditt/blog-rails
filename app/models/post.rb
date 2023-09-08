class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :recent_comments, -> { order(created_at: :desc) }, class_name: 'Comment'

  # validates :title, presence: true, length: { maximum: 250 }
  # validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_author_posts_counter
  after_destroy :decrement_author_posts_counter

  # attribute :likescounter, :integer, default: 0
  private

  def increment_author_posts_counter
    author.update(posts_counter: author.posts_counter + 1)
  end

  def decrement_author_posts_counter
    author.update(posts_counter: author.posts_counter - 1)
  end
end
