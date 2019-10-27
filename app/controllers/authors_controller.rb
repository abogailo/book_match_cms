class AuthorsController < ApplicationController
    def index
        @authors = Author.all
        #change to sorted after adding lamdas scope thing
      end
    
      def show
        @author = Author.find(params[:id])
      end
    
      def new
        @author = Author.new
      end
    
      def create
        @author = Author.new(author_params)
        if @author.save
          flash[:notice] = "author created successfully."
          redirect_to(authors_path)
        else
          render('new')
        end
      end
    
      def edit
        @author = Author.find(params[:id])
      end
    
      def update
        @author = Author.find(params[:id])
        if @author.update_attributes(author_params)
          flash[:notice] = "author updated successfully."
          redirect_to(author_path(@author))
        else
          render('edit')
        end
      end
    
      def delete
        @author = author.find(params[:id])
      end
    
      def destroy
        @author = author.find(params[:id])
        @author.destroy
        flash[:notice] = "author destroyed successfully."
        redirect_to(authors_path)
      end
    
      private
    
      def author_params
        params.require(:author).permit(
          :name)
      end
end
