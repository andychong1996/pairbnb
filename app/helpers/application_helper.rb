module ApplicationHelper
  private
    def authenticate_user!
      flash[:notice] = "Please login first"
      redirect_to root_path unless user_logged_in?
    end
end
