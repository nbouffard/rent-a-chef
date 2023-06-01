class UsersController < ApplicationController
  def index
    @chefs = User.all
  end

  private

  def user_params
    params.require(:user).permit(photos: [])
  end
end
