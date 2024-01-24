class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[edit update show destroy]
  def index
    @profiles = Profile.all
  end

  def show; end

  def new
    @profile = Profile.new
  end

  def create
    # tap
    @profile = Profile.new(profile_params)
    @profile.created_by = current_user
    if @profile.save
      redirect_to profiles_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_path, notice: 'Profile has been successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @profile.destroy
      redirect_to profiles_path, notice: 'Profile has been deleted.'
    else
      redirect_to profiles_path, alert: 'Failed to delete profile.'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :address, :timezone, :resume)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to profiles_path, notice: e
  end
end
