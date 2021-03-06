module SessionsHelper

  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def user_logged_in?
    !current_user.nil?
  end

end
