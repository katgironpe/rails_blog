class Tagging < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag, inverse_of: :taggings

  validates :tag_id, presence: true

  def resource
    self.taggable_type.constantize.find(self.taggable.id)
  end
end
