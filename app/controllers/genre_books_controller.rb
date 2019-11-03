class GenreBooksController < ApplicationController

    def index
        @genre_book = GenreBook.all
        #change to sorted after adding lamdas scope thing
    end

    def new
        @genre_book = GenreBook.new(book_id: params[:book_id])
        #change to sorted after adding lamdas scope thing
    end

    def create
        @genre = Genre.find(params[:genre_book][:genre_id])
        @genre_book = GenreBook.new(genre_book_params)
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


    def genre_book_params
        params.require(:genre_book).permit(
          :book_id, #can I use strong params for this
          genre_ids:[])
    end

end
