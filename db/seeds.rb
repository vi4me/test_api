5.times do
  user = User.create(email: Faker::Internet.email,
      password: Faker::Config.random.seed)

  article = Article.create(
    title: Faker::Fantasy::Tolkien.character,
    body: Faker::Fantasy::Tolkien.poem,
    user_id: 1,
    category: Faker::Books::Dune.quote)

  article.comments.create(body: Faker::Books::Dune.quote, user_id: 1)
end
