class ReviewsController < ApplicationController

  before_action :delete_review, :only => [:destroy]
  before_action :new_review, :only => [:create]

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
  
  def destroy
    @delete.destroy
    redirect_to product_path(@delete.product_id)
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def delete_review
      @delete = Review.find params[:id]
    end

    def new_review
      @review = Review.new(review_params)
  end

end