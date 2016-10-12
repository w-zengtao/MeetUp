class Comment < ApplicationRecord
  # associations
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  has_many :comments, as: :commentable, class_name: 'Comment'

  # callback
  before_create do
    self.index = self.commentable.comments.count + 1
  end
end
