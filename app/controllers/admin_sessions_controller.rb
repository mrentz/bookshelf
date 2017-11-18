class AdminSessionsController < ApplicationController
  def new
    @admin_session = AdminSession.new
  end

  def create
    @admin_session = AdminSession.new(admin_session_params)
    if @admin_session.save
      flash[:success] = "Welcome back!"
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    current_admin_session.destroy
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end

  private

  def admin_session_params
    params.require(:admin_session).permit(:login, :password, :remember_me)
  end
end
