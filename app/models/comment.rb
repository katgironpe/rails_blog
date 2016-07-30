class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :commentable_id, presence: true
  validates :commentable_type, presence: true
  validates :user_name, presence: true
  validates :body, presence: true

  default_scope -> { order('created_at') }

  paginates_per 10

  def as_json(options={})
    super(only:  [:id, :user_name, :body])
  end
end
