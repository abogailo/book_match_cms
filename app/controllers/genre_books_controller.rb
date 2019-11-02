class GenreBooksController < ApplicationController
    before_action :get_book 

    def index
        @genre_book = GenreBook.all
        #change to sorted after adding lamdas scope thing
    end

    def new
        @genre_book = GenreBook.new(book_id: params[:book_id])
        #change to sorted after adding lamdas scope thing
    end

    def create
        @genre_book = GenreBook.new(genre_book_params)
        @genre = Genre.find(params[:genre_book][:genre_id])
        
        @genre_book.book_id = @book.id
        @genre_book.genre_id = @genre.id
        #change to sorted after adding lamdas scope thing
        if @genre_book.save
            flash[:notice] = "genre relationship created successfully."
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

    def genre_book_params
        params.require(:genre_book).permit(
          :book_id, #can I use strong params for this
          :genre_id)
    end

end
