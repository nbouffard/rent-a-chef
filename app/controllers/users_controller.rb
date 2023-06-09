class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :ensure_chef, only: %i[edit update]

  def index
    @chefs = User.all
    if params[:query].present?
      @chefs = User.search(params[:query])
      if @chefs.empty?
        flash.now[:notice] = "No chefs found"
      end
    else
      @chefs = User.all
    end
  end

  def show
    @chef = User.find(params[:id])
    @marker = {
      lat: @chef.latitude,
      lng: @chef.longitude,
      info_window_html: render_to_string(partial: 'info_window', locals: { chef: @chef })
    }
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
    params.require(:user).permit(:first_name, :last_name, :description, :address, :date_of_birth, :city,
                                 :profile_photo, :price, :cuisine, photos: [])
  end

  def ensure_chef
    @chef = current_user
    redirect_to root_path unless @chef.is_chef?
  end

  # def user_params
  #   params.require(:user).permit(photos: [])
  # end
end
