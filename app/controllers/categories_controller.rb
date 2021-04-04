class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  def index
    @categories = Category.order('created_at DESC')
  end

  def show
   @category = Category.find(params[:id])
   @category.articles = @category.articles
   render json: {status: 'SUCCESS', category: @category, articles: @category.articles},status: :ok
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: {status: 'SUCCESS', message:'Saved categories', data: @category},status: :created
    else
      render json: {status: 'ERROR', message:'Category not saved', data: @category.errors},status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: {status: 'SUCCESS', message:'Updated categories', data: @category},status: :ok
    else
      render json: {status: 'ERROR', message:'Category not updated', data: @category.errors},status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    render json: {status: 'SUCCESS', message:'Deleted categories', data: @category},status: :ok
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end
