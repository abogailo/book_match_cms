class BooksController < ApplicationController
    before_action :authenticate
  
    def index
      @books = Book.all
      #@user_favorites = current_user.favorite_books
      #change to sorted after adding lamdas scope thing
    end
  
    def show
      @book = Book.find(params[:id])
      @review = @book.reviews.find_by(id: params[:id])
    end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      @author = Author.find_or_create_by(name: params[:book][:author_id])
      @book.author_id = @author.id 

      #adding this change in the model seems impossible. 
      #I need to be able to pass the form field input into the model 
      #to manipulate the input before validation for the strong params.
      if @book.save
        flash[:notice] = "book created successfully."
        redirect_to(books_path)
      else
        flash[:notice] = "issue creating book"
        render('new')
      end
    end
  
    def edit
      @book = Book.find(params[:id])
    end
  
    def update
      @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
        flash[:notice] = "book updated successfully."
        redirect_to(book_path(@book))
      else
        render('edit')
      end
    end
  
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      flash[:notice] = "book destroyed successfully."
      redirect_to(books_path)
    end
  
    def favorite
      @book = Book.find(params[:id])
      current_user.favorited_books << @book
      redirect_to book_path(@book)
    end

    def unfavorite
      @book = Book.find(params[:id])
      current_user.favorites.find_by(book_id: 
          @book).destroy
      redirect_to book_path(@book)
    end

    private
  
    def book_params
      params.require(:book).permit(
        :title, 
        :description, 
        :author_id, 
        :quantity, 
        :condition, 
        :price, 
        :year_published, 
        :admin_id,
        genre_ids:[], genres_attributes: [:name])
    end

  end
  
  