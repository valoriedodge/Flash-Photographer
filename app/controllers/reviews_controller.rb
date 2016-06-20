class ReviewsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

    def create
        @photographer = Photographer.find(params[:photographer_id])
        @review = @photographer.reviews.new(review_params)
        @review.user = current_user
        @new_review = Review.new

        if @review.save
            flash[:notice] = "Review saved successfully."
        else
            flash[:alert] = "Review failed to save."
        end

        redirect_to @photographer


    end

    def destroy
        @photographer = Photographer.find(params[:photographer_id])
        @review = @photographer.reviews.find(params[:id])

        if @review.destroy
            flash[:notice] = "Review was deleted successfully."
        else
            flash[:alert] = "Review couldn't be deleted. Try again."
        end
        redirect_to @photographer

    end

    private

    def review_params
        params.require(:review).permit(:comment, :rating)
    end

    def authorize_user
        review = Review.find(params[:id])
        @photographer = Photographer.find(params[:photographer_id])
        unless current_user == review.user || current_user.admin?
            flash[:alert] = "You do not have permission to delete this review."
            redirect_to @photographer
        end
    end
end
