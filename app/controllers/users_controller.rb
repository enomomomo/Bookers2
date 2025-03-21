class UsersController < ApplicationController

  def index
    @user = current_user
    @books = @user.books
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    # 投稿フォームの情報
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user  
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
