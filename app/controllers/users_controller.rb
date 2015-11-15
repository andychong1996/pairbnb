class UsersController < ApplicationController
  # before_filter :authenticate_user!, only: [:edit]
  def index
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     render 'show'
   else
     render 'edit'
   end
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :user_name, :email, :password, :password_confirmation)
  end
end
