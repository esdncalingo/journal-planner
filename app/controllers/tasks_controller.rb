class TasksController < ApplicationController
    protect_from_forgery with: :null_session
    # before_action :set_category
    
    def index
    end

    def new
        @task = Task.new
    
    end

    def create
        @task = Task.new(tasks_params)
        @task.status = "pending"
        @task.category_id = params[:id]

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
        Task.find(params[:tid]).destroy

        redirect_to "/home"
    end

    private

    def tasks_params
        params.permit(:title, :description, :deadline, :status, :category_id)
    end
    
end