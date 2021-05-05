class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :article_id, :user_id, :updated_at, :created_at
end
