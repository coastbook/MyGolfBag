class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path(current_user)
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdrawl
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
 private
  def user_params
    params.require(:user).permit(:name,:email,:is_deleted)
  end
  
end
