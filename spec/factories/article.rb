require 'faker'

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    body { Faker::Book.genre }
    user
  end
end
