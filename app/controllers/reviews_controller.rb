class ReviewsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    # @product = Product.find(params[:product_id])
    @review = current_user.reviews.build(review_params)
    if @review.save
      p "review was saved"
      flash[:success] = 'Review created!'
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'Review deleted'
    redirect_to request.referrer || root_url
  end

  private

    def review_params
      params.require(:review).permit(:content, :user_id, :product_id)
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end

end
