require 'faker'

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    body { Faker::Book.genre }
    category_id { 1 }
    user_id { 1 }
  end
end
