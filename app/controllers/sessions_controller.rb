class SessionsController < ApplicationController

  def new
    @current_user = User.new
  end

  def create

    @current_user = User.find_by_email(params[:user][:email])
    if @current_user && @current_user.authenticate(params[:user][:password])
      session[:user_id] = @current_user.id
      redirect_to users_path
    else
      flash[:error] = "Email or password is invalid"
      redirect_to sign_up_form_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
