class Post < ApplicationRecord
  extend FriendlyId

  validates :title, presence: true
  validates :body, presence: true

  friendly_id :title, use: :slugged
end
