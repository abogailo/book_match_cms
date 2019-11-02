class ReviewsController < ApplicationController
    before_action :get_book
    
    def new
      @review = Review.new(book_id: params[:book_id])
    end

    def create
      @review = Review.new(review_params)
      @review.book_id = @book.id
      if @review.save
          flash[:notice] = "review created successfully."
          redirect_to(books_path)
        else
          render('new')
        end
    end

    private
    
    def get_book
      @book = Book.find_by(params[:book_id])
      puts @book
    end

    def review_params
      params.require(:review).permit(
        :book_id, :rating, :review)
    end
end
