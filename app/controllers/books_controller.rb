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
        redirect_to book_path(book)
        render :new
    end
  end


  def update
    book = book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(list.id)
  end

  def destroy
     book = Book.find(books.id)
    book.destroy

  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

 end

