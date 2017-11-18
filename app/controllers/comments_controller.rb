class CommentsController < ApplicationController

  def create
    book = Book.find params[:book_id]
    comment = book.comments.new post_params
    comment.save
    flash[:success] = "Comment successfully saved"
    redirect_to book_path(book)
  end

  private
  def post_params
    params.require(:comment).permit(:author, :text)
  end
  
end
