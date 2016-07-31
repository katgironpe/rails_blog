class User < ApplicationRecord
  has_many :posts, inverse_of: :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  paginates_per 7

  devise :database_authenticatable, :confirmable, :lockable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  default_scope -> { order('last_name ASC') }

  def name
    [first_name, last_name].join(' ')
  end
end
