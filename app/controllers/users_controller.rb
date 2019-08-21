class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user,   only: [:edit, :update]
	def index
	    @users = User.all
	    @book = Book.new
        @book.user_id = current_user.id
        @user = User.find_by(id: current_user)
    end
    def edit
        @user = User.find(params[:id])
    end
     def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @books = Book.all
        @user = current_user
       if @book.save
         redirect_to book_path(@book.id), notice:'Book was successfully created.'
       else
        render "books/show"
      end
  end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        redirect_to user_path(@user.id), notice:'You have updated user successfully.'
       else
        render :edit
      end
    end
    def show
        @book = Book.new
        @book.user_id = current_user.id
        @user = User.find(params[:id])
        @books = @user.books
    end
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
    end
end

