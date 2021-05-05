class ShowArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category_id, :user_id, :updated_at, :created_at, :comments_count

  def comments_count
    object.comments.size
  end
end
