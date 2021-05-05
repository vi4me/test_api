class CommentsController < ApplicationController

  before_action :set_comment, only: [:update, :destroy]
  before_action :set_article
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    comments = @article.comments
    render json: comments, each_serializer: CommentSerializer
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: article, serializer: serializer,status: :created
    else
      render json: comment.errors, serializer: ErrorSerializer
    end
  end

  # PATCH/PUT /comments/1
  def update
    if comment.update(comment_params)
      render json: article, serializer: serializer, status: :ok
    else
      render json: comment.errors, serializer: ErrorSerializer
    end
  end

  def destroy
    comment = @article.comments.find(id: params[:id], user: current_user)
    comment.destroy
    render json: article, serializer: serializer, status: :ok
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:article_id, :user_id, :body)
    end
end
