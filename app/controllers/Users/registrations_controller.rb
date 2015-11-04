class RegistrationsController < ApplicationController

  def new
    @current_user = User.new
  end

  def create

  end

end
