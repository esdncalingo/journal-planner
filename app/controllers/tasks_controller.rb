class TasksController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :get_task, only: [:show, :edit, :update, :destroy]
    before_action :get_category
    
    def index
    end

    def new
        @task = @category.tasks.new
    
    end

    def create
        @task = @category.tasks.new(tasks_params)
        @task.status = "ongoing"

        if @task.save
            redirect_to "/home?category_id=#{params[:category_id]}", notice: "New task has been created"
        end
    end

    def show
        
    end

    def edit
    end

    def update
        if @task.update(tasks_params)
            redirect_to "/home?category_id=#{params[:category_id]}", notice: "Updated"
        end
    end

    def destroy
        @task.destroy

        redirect_to "/home?category_id=#{params[:category_id]}"
    end

    private

    def get_task
        @task = Task.find(params[:id])
    end

    def get_category
        @category = Category.find(params[:category_id])
    end

    def tasks_params
        params.permit(:title, :description, :deadline, :status, :category_id)
    end
    
end