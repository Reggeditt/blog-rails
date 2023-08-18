class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  alias_attribute :author, :user

  after_create :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update_comments_counter
  end
end
