class ReviewsController < ApplicationController
  before_action :set_chef, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.chef = @chef
    if current_user == @chef
      redirect_to user_path(@chef), alert: 'You cannot review your own profile.'
    elsif @review.save
      redirect_to user_path(@chef), notice: 'Review Created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_chef
    @chef = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
