class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :short_body, :category_id, :user_id, :updated_at, :created_at, :comments_count

  def short_body
    object.body.truncate(500, :omission => "...")
  end
end
