class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.order('created_at DESC')
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @user = @user.articles
    render json: @user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
