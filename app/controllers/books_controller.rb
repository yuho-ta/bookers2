class BooksController < ApplicationController
before_action :authenticate_user!
   def new
     @book=Book.new
   end 
   
   def show 
     @book=Book.find(params[:id])
     @book_new=Book.new
     @user=@book.user
     @profile_image=@book.user.profile_image
   end 
   
   def index
     @books=Book.all
     @book=Book.new
     @user=current_user
     @profile_image=@user.profile_image
   end 
   
   def create
     @book=Book.new(book_params)
     @book.user_id=current_user.id
     @books=Book.all
     @user=@book.user
     if @book.save
        flash[:notice]="You have created book successfully."
        redirect_to book_path(@book)
     else 
        render "index"
     end
   end 
   
   def edit
     @book=Book.find(params[:id])
     @user=@book.user
     unless @book.user_id == current_user.id
        redirect_to books_path
     end
   end
   
   def update
     @book=Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice]="You have updated book successfully."
        redirect_to book_path(@book)
     else
        render "edit"
     end
   end
   
   def destroy
     @book=Book.find(params[:id])
     @book.destroy
     redirect_to books_path
   end
   
   private
   
   def book_params
     params.require(:book).permit(:title, :body)
   
   end
   
end