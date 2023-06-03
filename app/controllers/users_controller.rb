class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_chef, only: [:edit, :update]

  def index
    @chefs = User.all
  end

  def show
    @chef = User.find(params[:id])
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      redirect_to @chef, notice: 'Profile updated successfully!'
    else
      render :edit
    end
  end

  private

  def chef_params
    params.require(:user).permit(:first_name, :last_name, :description, :address, :date_of_birth, :price)

  end

  def ensure_chef
    @chef = current_user
    redirect_to root_path unless @chef.is_chef?

  end

  def user_params
    params.require(:user).permit(photos: [])
  end
end
