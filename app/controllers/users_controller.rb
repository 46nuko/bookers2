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
  @books = @user.books 
end

def index
  @users = User.all
end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :email_address, :password, :password_confirmation)
  end
end
