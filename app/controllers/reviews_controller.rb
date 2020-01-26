class ReviewsController < ApplicationController
    
    def new
      @review = Review.new(book_id: params[:book_id])
    end

    def index
        if params[:book_id]
          @reviews = Book.find(params[:book_id]).reviews
        elsif params[:user_id]
          @reviews = User.find(params[:user_id]).reviews
        else 
          @review = Review.all
        end
    end

    def show
        @review = Review.find(params[:id])
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
      end
    end

    private

    def review_params
      params.require(:review).permit(
        :book_id, 
        :rating, 
        :review,
        :user_id)
    end
end
