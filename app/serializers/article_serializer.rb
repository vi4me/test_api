class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :short_body, :category_id, :user_id, :updated_at, :created_at, :comments_count
  has_many :comments, serializer: CommentSerializer

  def short_body
    object.body.truncate(5, :omission => "...")
  end

  def comments_count
    object.comments.count
  end
end
