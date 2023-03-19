class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :selected_task, only: [:index, :show]

    def index
        @categories = Category.all.where(user_id: current_user.id)
    end

    def new
    end

    def create
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

    def selected_task
        @tasks = Task.all.where(category_id: params[:id])
    end
end
