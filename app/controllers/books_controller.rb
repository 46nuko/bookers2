class BooksController < ApplicationController
  def new
    @book = Book.find(params[:id])
  end

  def index
  end

  def show
  end
end
