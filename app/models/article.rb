class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # accepts_nested_attributes_for :comments, allow_destroy: true

  validates :title, presence: true,
                    length: { maximum: 100 }
  validates :body, presence: true

end
