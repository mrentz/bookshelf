class BooksController < ApplicationController

  def index
#    @users = User.paginate(page: params[:page])
    @books = Book.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
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

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes post_params
      flash[:notice] = "#{@book.title} successfully updated"
      redirect_to @book
    else
      render :edit
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.paginate :page => params[:page], :per_page => 10 
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "#{book.title} deleted"
    redirect_to books_path
  end
  
  private
  def post_params
    params.require(:book).permit(:id, :title, :thoughts)
  end
  
end
