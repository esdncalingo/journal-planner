class TasksController < ApplicationController
    protect_from_forgery with: :null_session
        
    
    
    def index
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.find(params[:id])
        @task = @category.tasks.new
    end

    def create

        @category = Category.find(params[:id])

        @task = @category.tasks.new(tasks_params)
        @task.status = "pending"

        if @task.save
            redirect_to '/home'
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

    def tasks_params
        params.require(:task).permit(:title, :description, :deadline, :status, :category_id)
    end
    
end