class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.references :user, type: :uuid
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
