class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comments_params)
    redirect_to user_article_path(@article.user_id,@article)
  end

  def destroy
  end

  private

    def comments_params
      params.require(:comment).permit(:text).merge(:user_id => current_user)
    end
end
