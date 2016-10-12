class Comment < ApplicationRecord
  # associations
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  has_many :comments, as: :commentable, class_name: 'Comment'
end
