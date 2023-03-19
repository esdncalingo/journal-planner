class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.user_id = current_user.id
        
        if @category.save
            redirect_to "/home"
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def category_params
        params.require(:category).permit(:name, :user_id)
    end

end
