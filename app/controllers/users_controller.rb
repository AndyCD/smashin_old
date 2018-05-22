class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation, :role)
    end
end
