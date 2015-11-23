class RegistrationsController < ApplicationController

  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      flash[:success] = "You have successfully signed up"
      session[:user_id] = @current_user.id
      redirect_to @current_user
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation)
    end
end
