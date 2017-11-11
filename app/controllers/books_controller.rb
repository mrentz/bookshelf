class BooksController < ApplicationController

  def index
#    @users = User.paginate(page: params[:page])
    @books = Book.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new post_params
    if @book.save
      flash[:notice] = "#{@book.title} successfully saved"
      redirect_to @book
    else
      render :new
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.paginate :page => params[:page], :per_page => 10 
  end

  private
  def post_params
    params.require(:book).permit(:title, :thoughts)
  end
  
end
