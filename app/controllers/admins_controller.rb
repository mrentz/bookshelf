class AdminsController < ApplicationController

# before_filter :login_required, :except => [:new]

  def new
    @admin = Admin.new
  end

  def index
    @admins = Admin.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def create
    @admin = Admin.new(admins_params)
    if @admin.save
      flash[:success] = "Account registered!"
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @books = current_admin.books.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end
  
  private

  def admins_params
    params.require(:admin).permit(:login, :password, :password_confirmation, books_attributes: [:id, :name, :admin_id])
  end
end

