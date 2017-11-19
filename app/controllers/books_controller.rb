class BooksController < ApplicationController
  
before_filter :login_required, :except => [:index, :show]
  
  def index
#   @users = User.paginate(page: params[:page])
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
      flash[:success] = "#{@book.title} successfully saved"
      redirect_to @book
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes post_params
      flash[:success] = "#{@book.title} successfully updated"
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
    flash[:success] = "#{book.title} deleted"
    redirect_to books_path
  end
  
  private
  def post_params
    params.require(:book).permit(:id, :title, :thoughts)
  end
  
  def login_required
    unless current_admin
      flash[:warning] = 'Only logged in admins an access this page.'
      redirect_to books_path
    end
  end
  
end
