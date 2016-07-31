class Post < ApplicationRecord
  extend FriendlyId
  include Taggable
  include Commentable

  belongs_to :user, inverse_of: :posts

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  default_scope -> { order('created_at DESC') }

  friendly_id :title, use: :slugged
  paginates_per 10

  def author_name
    user.try(:name)
  end
end
