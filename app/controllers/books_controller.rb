class BooksController < ApplicationController
	def top

	end	
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
    @books =Book.all
   if @book.save
      flash[:success] = "successfully"
      redirect_to book_path(@book)
    else
     flash.now[:danger] = "error"
     render 'index'
     end
 end

   def edit
  	@book = Book.find(params[:id])
  	
end
  
  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
  flash[:success] = "successfully"
  redirect_to book_path(@book)
  else 
	@books= Book.all
	render :edit
	end
 end
  
  
  def destroy
	@book = Book.find(params[:id])
	@book.destroy
    flash[:message] = "Book was successfully destroyed."
    redirect_to books_path
  end
 end
private
   def book_params
	params.require(:book).permit(:title,:body)
   end
