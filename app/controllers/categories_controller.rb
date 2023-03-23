class CategoriesController < ApplicationController
    #after_action method/action, only: [:new]
    before_action :get_category

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
        if @category.update(category_params)
            redirect_to "/home"
        end
    end

    def destroy
    end

    private
    
    def get_category
        if params[:id]
            @category = Category.find(params[:id])
        end
    end

    def category_params
        params.require(:category).permit(:name, :user_id)
    end

end
