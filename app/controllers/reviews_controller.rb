class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to product_path(params[:product_id]) ,  notice: "Comment created"
    else
      redirect_to @product, notice: "There was an error creating the comment: #{@review.errors.full_messages}"
    end
  end
 
  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end