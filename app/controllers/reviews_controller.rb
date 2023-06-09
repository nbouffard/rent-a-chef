class ReviewsController < ApplicationController
  before_action :set_user, only: %i[new create]

  def new
    @review = @user.reviews.new
  end

  def create
    @review = @user.reviews.build(review_params)
    if @review.save
      redirect_to @user, alert: 'Review Created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
