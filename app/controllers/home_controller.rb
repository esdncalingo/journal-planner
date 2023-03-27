class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :selected_task, only: [:index, :show]

    def index
        @categories = Category.order(created_at: :desc).where(user_id: current_user.id)
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
        user = User.find(current_user.id)
        if params[:category_id]
            category = Category.find(params[:category_id])
            @tasks = category.tasks
        elsif params[:view] === "completed"
            @tasks = user.tasks.order(id: :asc).where(status: "completed")
        elsif params[:view] === "today"
            @tasks = user.tasks.order(id: :asc).where('tasks.created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
        end
    end
end
