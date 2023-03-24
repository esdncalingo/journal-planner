class CategoriesController < ApplicationController
    #after_action method/action, only: [:new]
    before_action :get_category
    before_action :get_user

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = @user.categories.new(category_params)
        
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
            redirect_to "/home?category_id=#{params[:id]}"
        end
    end

    def destroy
    end

    private

    def get_user
        @user = User.find_by_id(current_user.id)
    end
    
    def get_category
        if params[:id]
            @category = Category.find(params[:id])
        end
    end

    def category_params
        params.require(:category).permit(:name, :user_id)
    end

end
