class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  alias_attribute :author, :user

  after_create :update_post_likes_counter


  private

  def update_post_likes_counter
    post.update_likes_counter
  end
end
