class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index, status: :unprocessable_entity
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(book.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy 
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body )
  end
end
