class UsersController < ApplicationController
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    # 投稿フォームの情報
    @book = Book.new
    # Booksの部分
  end

  def edit
  end
end
