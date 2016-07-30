class Post < ApplicationRecord
  extend FriendlyId

  belongs_to :user, inverse_of: :posts
  has_many :comments, as: :commentable, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  default_scope -> { order('created_at') }

  friendly_id :title, use: :slugged
  paginates_per 7

  def author_name
    user.try(:name)
  end
end
