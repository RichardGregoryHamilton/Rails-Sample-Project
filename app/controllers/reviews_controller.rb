class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :find_game, only: [:index, :create, :edit, :update, :destroy]
  
  def index
	@review = Review.all
  end

  def new
    @review = Review.new
  end

  def edit
     @review = Review.find(params[:id])
  end

  def create
    @review = @game.reviews.build(review_params)
 
    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to game_reviews_path(@game)
    else
      render 'new'
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated"
      redirect_to game_reviews_path(@game)
    else
      flash[:error] = "There was an error updating your review"
      render 'edit'
    end
  end

  def destroy
    @review = @game.reviews.find(params[:id])
    @review.destroy
    redirect_to(@review.game)
  end

  private
  
    def set_review
      @review = Review.find(params[:id])
    end

	def find_game
	  @game = Game.find(params[:game_id])
	end
	
    def review_params
      params.require(:review).permit(:username, :body, :post_id)
    end
end