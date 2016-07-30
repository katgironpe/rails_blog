class CommentSerializer < ActiveModel::Serializer
  attributes :id, :commentable_id, :commentable_type, :user_name, :body
end
