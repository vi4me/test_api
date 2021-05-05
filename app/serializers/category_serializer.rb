class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :updated_at, :created_at, :category_articles

  def category_articles
    object.articles.map { |article| { id: article.id,
                                      title: article.title,
                                      body: article.body.truncate(5, :omission => "..."),
                                      user_id: article.user_id,
                                      updated_at: article.updated_at,
                                      created_at: article.created_at
                                    }
                          }
    end
end
