class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_article
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    comments = @article.comments
    render json: comments, each_serializer: CommentSerializer
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: {status: 'SUCCESS', message:'Saved comment', data: comment},status: :created
    else
      render json: {status: 'ERROR', message:'Comment not saved', data: comment.errors},status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if comment.update(comment_params)
      render json: {status: 'SUCCESS', message:'Updated comment', data: comment},status: :ok
    else
      render json: {status: 'ERROR', message:'Comment not updated', data: comment.errors},status: :unprocessable_entity
    end
  end

  def destroy
    comment = @article.comments.find_by(id: params[:id], user: current_user)
    comment.destroy
    render json: {status: 'SUCCESS', message:'Deleted comment', data: comment},status: :ok
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
