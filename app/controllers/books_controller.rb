class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    @book.save
    redirect_to books_path
  end
  
  def show
  end

  def edit
  end
  
  private

  def post_image_params
    params.require(:book).permit(:title, :body )
  end
end
