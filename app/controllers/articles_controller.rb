class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /articles.json
  def index
    @articles = Article.order('created_at DESC').page params[:page]
    render json: @articles, include: [:comments], each_serializer: ArticleSerializer
  end

  def show
    @article = Article.find(params[:id])
    render json: @article, include: [:comments], serializer: ShowArticleSerializer
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: {status: 'SUCCESS', message:'Saved article', data: @article},status: :ok
    else
      render json: {status: 'ERROR', message:'Article not saved', data: @article.errors},status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: {status: 'SUCCESS', message:'Updated article', data: @article},status: :ok
    else
      render json: {status: 'ERROR', message:'Article not updated', data: @article.errors},status: :unprocessable_entity
    end
  end

  def destroy
    @article = @article.find_by(id: params[:id], user: current_user)
    @article.destroy
    render json: {status: 'SUCCESS', message:'Deleted article', data: @article},status: :ok
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:user_id, :title, :body, :category)
    end
end
