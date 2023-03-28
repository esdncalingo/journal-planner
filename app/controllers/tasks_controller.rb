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

        respond_to do |format|
            if @task.save
                format.html {redirect_to "/home?category_id=#{params[:category_id]}", notice: "New task has been created" }
            else
                render :new, status: :unprocessable_entity
            end
        end
    end

    def show
        
    end

    def edit
    end

    def update
        respond_to do |format|
            if @task.update(tasks_params)
                format.html {redirect_to "/home?category_id=#{params[:category_id]}", notice: "Updated"}
            else
                render :new, status: :unprocessable_entity
            end
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