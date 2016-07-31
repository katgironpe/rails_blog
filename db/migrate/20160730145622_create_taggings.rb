class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings, id: :uuid do |t|
      t.references :tag, type: :uuid
      t.references :taggable, polymorphic: true, type: :uuid

      t.timestamps
    end

    add_index :taggings, :taggable_id
  end
end
