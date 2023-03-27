class CategoriesController < ApplicationController
    #after_action method/action, only: [:new]
    before_action :category_list, only: [:index, :create, :update]
    before_action :get_category
    before_action :get_user

    def index
    end

    def new
        @category = Category.new
    end

    def create
        @category = @user.categories.new(category_params)
        
        respond_to do |format|
            if @category.save
                format.turbo_stream do
                   render turbo_stream: [
                    turbo_stream.update("sidepanel", partial: "sidepanel" ,locals: {category: @categories}),
                    turbo_stream.update("modal", "")
                   ] 
                end
            else
                render :new, status: :unprocessable_entity
            end
        end
    end

    def show
        #redirect_to "/home?category_id=#{params[:id]}"
    end

    def edit
    end

    def update
        respond_to do |format|
            if @category.update(category_params)
                format.turbo_stream do
                    render turbo_stream: [
                        turbo_stream.update("sidepanel", partial: "sidepanel" ,locals: {category: @categories}),
                        turbo_stream.update("modal", "")
                    ]
                end
            else
                render :new, status: :unprocessable_entity
            end
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
        params.require(:category).permit(:name, :description, :user_id)
    end

    def category_list
        @categories = Category.order(created_at: :desc).where(user_id: current_user.id)
    end

end
