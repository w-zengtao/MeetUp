class MeetUp < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, class_name: 'Comment'
end
