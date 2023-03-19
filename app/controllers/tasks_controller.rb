class TasksController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_category
        
    def index
    
    end

    def new
        @task = @category.tasks.new
    end

    def create
        @task = @category.tasks.create(tasks_params)
        @task.status = "pending"
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

    def set_category
        @category = Category.find(params[:id])
    end

    def tasks_params
        params.require(:task).permit(:title, :description, :deadline, :status, :category_id)
    end
    
end