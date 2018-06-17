class UsersController < ApplicationController
  before_action :authenticate_user!, :authorize_admin

  def index
    @users_count = User.count
    @users_by_roles = User.group(:role).order(:role).count
    @deleted_users_count = User.where.not(deleted_at: nil).count

    if params[:term] && !params[:term].empty?
      @users = User.where("name like :search or email like :search", search: "%#{params[:term]}%").order(id: :desc).page(params[:page])
    else
      if params[:deleted_at]
        @users = User.where.not(deleted_at: nil).order(id: :desc).page(params[:page])
      else
        if params[:role] && !params[:role].empty?
          @users = User.where(role: params[:role]).order(id: :desc).page(params[:page])
        else
          @users = User.order(id: :desc).page(params[:page])
        end
      end
    end

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
