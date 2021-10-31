class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def five_most_recent_comments(limit = 5)
    comments.order('created_at DESC').limit(limit)
  end
end
