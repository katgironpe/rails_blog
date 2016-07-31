class Tag < ApplicationRecord
  has_many :taggings, inverse_of: :tag

  validates :name, presence: true, uniqueness: true

  def self.filter_by_name(name)
    tag = self.where(name: name.strip)
    tag.first if tag.present?
  end
end
