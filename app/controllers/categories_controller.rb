class CategoriesController < ApplicationController
    def index
        @category = Category.all
        #change to sorted after adding lamdas scope thing
    end

    def new
        @category = Category.new
        #change to sorted after adding lamdas scope thing
    end

    def create
        @category = Category.new(category_params)
        #change to sorted after adding lamdas scope thing
        if @category.save
            flash[:notice] = "category created successfully."
            redirect_to(books_path)
        else
            render('new')
        end
    end

    private


    def category_params
        params.require(:category).permit(
          :name)
    end

end
