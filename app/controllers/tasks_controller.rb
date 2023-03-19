class TasksController < ApplicationController
    
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(tasks_params)
        @task.status = "pending"
        @task.category_id = params[:item]

        if @task.save
            redirect_to "/home"
        end
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

    def tasks_params
        params.require(:task).permit(:title, :description, :deadline, :status, :category_id)
    end
    
end