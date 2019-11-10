class ReviewsController < ApplicationController
    
    def new
      @review = Review.new(book_id: params[:book_id])
    end

    def create
      @review = Review.new(review_params)
      if @review.save
          flash[:notice] = "review created successfully."
          redirect_to(books_path)
        else
          render('new')
        end
    end

    def destroy
      if current_user.admin
        @review.delete
        redirect_to show_episode_path(@show, @episode), flash: {notice: "comment deleted"}
      end
    end

    private

    def review_params
      params.require(:review).permit(
        :book_id, 
        :rating, 
        :review)
    end
end
