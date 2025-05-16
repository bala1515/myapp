class MainpageController < ApplicationController
  require 'razorpay'

  Razorpay.setup('rzp_live_gCl0983OhA6nBG', 'zo2hB7VwAUzw4Eh3BkMp0L5E') # Use real keys from Razorpay Dashboard

  def create_order
    order = Razorpay::Order.create amount: 1000, currency: 'INR', receipt: 'receipt_123'
    render json: { order_id: order.id }
  end


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
