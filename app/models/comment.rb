class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_comments_counter
  after_destroy :decrement_comments_counter

  private

  def increment_comments_counter
    post.increment!(:commentscounter)
  end

  def decrement_comments_counter
    post.decrement!(:commentscounter)
  end
end
