class Comment < ApplicationRecord
  belongs_to :article, counter_cache: true
  belongs_to :user

  validates :body, presence: true,
            length: { maximum: 1000 }

end
