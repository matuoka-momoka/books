class BooksController < ApplicationController
     #before_action :authenticate_user!
     #before_action :configure_permitted_parameters, if: :devise_controller?
 def top
 end

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


  # 以下を追加
  def create
    @book = Book.new(book_params)
    if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book)
    else
    @books = Book.all
        render :index
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        flash[:notice] = "Book was successfully created."
        redirect_to :book

    else
      render:edit
    end
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path

  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end