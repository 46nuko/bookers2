class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "ユーザー登録が完了しました！続けてログインしてください。"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
def show
  @user = User.find(params[:id])
  @book = Book.new
  @user = current_user
  @books = @user.books 
end

def index
  @user = current_user
  @book = Book.new
  @users = User.all
end

def edit
  @user = User.find(params[:id])
end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(user.id) 
    else
      render :edit, status: :unprocessable_entity
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :email_address, :password, :password_confirmation, :profile_image)
  end
end
