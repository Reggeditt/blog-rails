class Comment < ApplicationRecord
  # belongs_to :user, foreign_key: 'author_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  # alias_attribute :author, :user
end
