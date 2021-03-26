json.articles @articles do |article|
  json.title article.title
  json.body article.body.truncate(500, :omission => "...")
  json.category article.category
  json.created_at article.created_at
  json.comments_count article.comments.count
end
