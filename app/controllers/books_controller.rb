class BooksController < ApplicationController
  before_action :book_set, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
   if @book.save
     redirect_to books_path, notice: "Book was successfully created"
   elsif 
     render :new
   end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
   if @book.update(book_params)
     redirect_to book_path, notice: "Book was successfully updated"
   elsif 
     render :edit
   end
  end

  def destroy
    
    if @book.destroy
      redirect_to books_path, notice: "Book was successfully destroied"
    end
  end

  private

  def book_set
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
