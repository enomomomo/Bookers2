class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @user = current_user
    @books = @user.books
    @books = Book.all
    # 投稿フォームの情報
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    # UserinfoとNewbookの部分
    # @user = User.find(params[:id])
    @books = @user.books
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/users'
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
