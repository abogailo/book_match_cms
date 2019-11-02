class GenresController < ApplicationController
    def index
        @genres = Genre.all
        #change to sorted after adding lamdas scope thing
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            flash[:notice] = "genre created successfully."
            redirect_to(genres_path)
        else
            render('new')
        end
    end

    private

    def genre_params
        params.require(:genre).permit(
            :name)
    end

end
