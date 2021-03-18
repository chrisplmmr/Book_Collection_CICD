class BooksController < ApplicationController
  require 'date'

  # Find all books for template
  def index
    @books = Book.order('id ASC') # Order by position
  end

  # Find book for template
  def show
    @book = Book.find(params[:id])
    flash[:alert] = 'Notice: Book Shown Successfully!'
  end

  # Form for create
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(books_path)
      flash[:alert] = 'Notice: Book Created Successfully'
    else
      # render('new')
      redirect_to(new_book_path)
      flash[:alert] = 'Notice: Title Cannot Be Blank'
    end
  end

  # Form for update
  def edit
    @book = Book.find(params[:id])
  end

  def update
    # date = Date.civil(*params[:book].sort.map(&:last).map(&:to_i))
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to(books_path) # redirect_to(book_path(@book))
      flash[:alert] = 'Notice: Book Successfully Edited'
    else
      render('edit')
    end
  end

  # Form for destroy
  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to(books_path)
    flash[:alert] = 'Notice: Book Deleted Successfully'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end
end
