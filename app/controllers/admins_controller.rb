class AdminsController < ApplicationController
  def new
    @admin = Admin.new
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
  end
  
  private

  def admins_params
    params.require(:admin).permit(:login, :password, :password_confirmation)
  end
end

