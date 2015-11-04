class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    render :"home/index"
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
