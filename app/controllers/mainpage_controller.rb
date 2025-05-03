class MainpageController < ApplicationController

  def index
  end

  def create
    if params[:type].to_i == 1
      Profile.create!(profile_params)
      redirect_to view_path, notice: 'profile create sucessfully'
    elsif params[:type].to_i == 2
      profile = Profile.find_by(id: params[:id])
      profile.update!(edit_params)
      redirect_to view_path, notice: 'Profile updated successfully'
    elsif params[:type].to_i == 3
      profile = Profile.find_by(id: params[:id])
      profile.destroy!
      redirect_to view_path, notice: 'profile create sucessfully'
    end
  end

  def view
    @profiles = Profile.all
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :age, :address)
  end

  def edit_params
    params.require(:edit).permit(:name, :age, :address)
  end
end
