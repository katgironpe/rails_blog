class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :commentable, polymorphic: true, type: :uuid
      t.string :user_name
      t.text :body
      t.timestamps
    end
  end
end
