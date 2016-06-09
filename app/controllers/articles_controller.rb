class ArticlesController < ApplicationController
  before_action :require_user

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find(@current_user)
    @article = @user.articles.create(article_params)
    redirect_to root_path
  end

  def edit
   @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to user_path(current_user)
  end

private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
