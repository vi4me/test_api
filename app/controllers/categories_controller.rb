class CategoriesController < ApplicationController

  def index
    categories = Category.order('created_at DESC')
    render json: categories, each_serializer: CategorySerializer
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end
