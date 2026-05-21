class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 
  before_action :is_matching_login_user, only: [:edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for(@user)
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
def show
  @user = User.find(params[:id])
  @book = Book.new
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
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id) 
    else
      render :edit, status: :unprocessable_entity
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :email_address, :password, :password_confirmation, :profile_image)
  end

   def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == Current.user.id
      redirect_to user_path(@user)
    end

  end
end
