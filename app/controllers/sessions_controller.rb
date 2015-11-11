class SessionsController < ApplicationController

  def new
    @current_user = User.new
  end


  def create_fb_session
    @current_user = User.from_omniauth_facebook(env["omniauth.auth"])
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to users_path
    else
      flash[:facebook_error] = "User with this email already exist"
      redirect_to root_path
    end
  end

  def create
    @current_user = User.find_by_email(params[:user][:email])
    if @current_user && @current_user.authenticate(params[:user][:password])
      session[:user_id] = @current_user.id
      redirect_to users_path
    else
      flash[:error] = "Email or password is invalid"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
