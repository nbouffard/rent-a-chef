class ReviewsController < ApplicationController
  before_action :set_chef, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.chef = @chef
    if @review.save
      redirect_to user_path(@review.chef), alert: 'Review Created.'
    else
      render :new, status: :unproccessible_entity
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
