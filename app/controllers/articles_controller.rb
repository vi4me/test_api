class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /articles.json
  def index
    articles = Article.order('created_at DESC').page(params[:page]).per(params[:per_page])
    render json: articles, each_serializer: ArticleSerializer
  end

  def show
    article = Article.find(params[:id])
    render json: article, serializer: ShowArticleSerializer
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: article, serializer: serializer, status: :created
    else
      render json: article.errors, serializer: ErrorSerializer
    end
  end

  # PATCH/PUT /articles/1
  def update
    if article.update(article_params)
      render json: article, serializer: serializer, status: :ok
    else
      render json: article.errors, serializer: ErrorSerializer
    end
  end

  def destroy
    article = article.find(id: params[:id], user: current_user)
    article.destroy
    render json: article, serializer: serializer, status: :ok
  end

  private

    def set_article
      article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:user_id, :title, :body, :category_id, :comments_count)
    end
end
