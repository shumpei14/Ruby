class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

 def new
 	@book = Book.new
 end

 def create
 	@book = Book.new(book_params)
 	# redirect_to book_path(book.id)
 	if @book.save
 		redirect_to book_path(@book.id)
 	else
 		@books = Book.all
 		render'index'
 		# redirect_to book_path(book.id)
 	end
 	# redirect_to books_path(book.id)
 	# book = Book.new(book_params)
 	# book.save
 end
 def update
 	book = Book.find(params[:id])
 	book.update(book_params)
 	redirect_to book_path(book.id),notice: ""
 end
 def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end
 def book_params
      params.require(:book).permit(:title, :body)
    end
end
