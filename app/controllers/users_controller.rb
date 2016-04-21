class UsersController < ApplicationController
  respond_to :html, :js
  include ApplicationHelper


  def edit
    @post = User.find(params[:id])
  end

  def update
    @user = current_user
    if user_admin(@user)
      @user = User.find(params[:id])
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      if @user.update_attributes(user_params)
        if @user.role == 'admin'
          flash[:notice] = "#{@user.email} was granted admin privileges!"
          redirect_to admin_index_path
        else
          flash[:notice] = "#{@user.email}'s admin privileges were revoked!"
          redirect_to admin_index_path
        end
      else
        flash[:error] = "There was an error updating the user. Please try again."
        redirect_to admin_index_path
      end
    else
      not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

end
