class User < ApplicationRecord
  has_many :posts, inverse_of: :user

  paginates_per 7

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope -> { order('last_name') }

  def name
    [first_name, last_name].join(' ')
  end
end
