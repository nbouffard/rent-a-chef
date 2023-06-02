class ChefsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_chef, only: [:edit, :update]

  def edit
    @chef = current_user
  end

  def update
    @chef = current_user
    if @chef.update(chef_params)
      redirect_to @chef, notice: 'Profile updated successfully!'
    else
      render :edit
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:first_name, :last_name, :bio, :specialties)
  end

  def ensure_chef
    redirect_to root_path unless current_user.is_chef?
  end
end
