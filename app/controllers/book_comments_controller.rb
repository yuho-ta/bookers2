class BookCommentsController < ApplicationController
    def create
        book=Book.find(params[:book_id])
        comment=current_user.book_comments.new(book_comment_params)
        comment.save
        redirect_to book_path(book)
    end
    def destroy
        Book.find(params[:id]).destroy
        redirect_to book_path(params[:book_id])
    end
    
    private
    
    def comment_params
        comment.require(:book_comment).permit(:comment)
    end
end
