class Tagging < ApplicationRecord
  belongs_to :tag, inverse_of: :taggings
  belongs_to :taggable, polymorphic: true

  validates :tag_id, presence: true
  validates :taggable_id, presence: true
  validates :taggable_type, presence: true

  def resource
    self.taggable_type.constantize.find(self.taggable.id)
  end
end
