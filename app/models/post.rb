class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: { message: 'Title must not be blank' },
                    length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal: 0
  validates_numericality_of :likes_counter, only_integer: true, greater_than_or_equal: 0

  after_create :update_post_counter

  def update_post_counter
    user.update_column('posts_counter', user.posts_counter + 1)
  end

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
