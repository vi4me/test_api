class ChangeArticlesByCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :category, index: true
  end
end
