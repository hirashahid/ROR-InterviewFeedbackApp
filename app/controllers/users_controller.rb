class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User has been successfully updated.'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(role_ids: [])
  end
end
