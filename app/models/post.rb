class Post < ApplicationRecord
  extend FriendlyId

  paginates_per 20

  belongs_to :user, inverse_of: :posts

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  friendly_id :title, use: :slugged

  def author_name
    user.try(:name)
  end
end
