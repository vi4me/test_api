class ChangeArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :category, :string
  end
end
