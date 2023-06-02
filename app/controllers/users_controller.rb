class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @chefs = User.all
  end

  def show
    @chef = User.find(params[:id])
  end

  def destroy
    @chef = User.find(params[:id])
    if @chef.is_chef? && @chef == current_user
      @chef.destroy
      redirect_to root_path, alert: 'Profile has been deleted.'
    end
  end

  private

  def user_params
    params.require(:user).permit(photos: [])
  end
end
