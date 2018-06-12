class UsersController < ApplicationController
  before_action :authenticate_user!, :authorize_admin

  def index
    @users_count = User.count
    @users_by_roles = User.group(:role).order(:role).count
    @users = User.page(params[:page]).order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success] = "User updated successfully."
     redirect_to @user
   else
     render 'edit'
   end
  end

  def destroy
   @user = User.find(params[:id])
   if @user.destroy
     redirect_to users_url, notice: "User deleted."
   end
  end

  def reactivate_user
      @user = User.find(params[:id])
      if @user.update_attribute(:deleted_at, nil)
        flash[:success] = "User reactivated successfully."
        redirect_to @user
      else
        render 'edit'
      end
    end


  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation, :role)
    end

    def authorize_admin
      if current_user.role.nil? || current_user.role.to_sym != :admin
        flash[:alert] = "Not Authorized!"
        redirect_to root_url
      end
    end

end
