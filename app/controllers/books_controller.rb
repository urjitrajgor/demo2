class BooksController < ApplicationController
  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to :controller => 'books', :action => 'show', :id => @book.id
    else
      @authors = Author.all
      render :action => 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to :controller => 'books', :action => 'show', :id => @book.id
    else
      @authors = Author.all
      render :action => 'new'
    end
  end

  def index
    @books = Book.all
  end

  def delete
    @books = Book.find(params[:id])
    @books = Book.destroy
  end
  
end


