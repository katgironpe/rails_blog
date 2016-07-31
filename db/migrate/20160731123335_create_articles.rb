class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.references :user, type: :uuid
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
