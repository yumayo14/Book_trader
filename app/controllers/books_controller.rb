class BooksController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
    @books = Book.order('id ASC').page(params[:page]).per(10)
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
    redirect_to action: :index
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    book = Book.find(params[:id])
    if book.user_id == current_user.id
      book.destroy
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.user_id == current_user.id
      book.update(book_params)
    end
  end

  def search
    @books = Book.where('title Like(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
  end

  private

  def book_params
    params.require(:book).permit(:title, :category, :cluster, :price, :author, :condition, :detail, :goods).merge(user_id: current_user.id)
  end
end


