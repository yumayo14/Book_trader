class CommentsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to book_path(params[:book_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(book_id: params[:book_id], user_id: current_user.id)
  end
end
