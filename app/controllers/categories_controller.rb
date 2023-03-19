class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def new
        
    end

    def create
        @category = Category.new(category_params)
        @category.save
    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

    def category_params
        params.require(:category).permit(:name, :user_id)
    end

end
