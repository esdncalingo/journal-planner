class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def new
        respond_to do |format|
          format.html
          format.js
        end
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
end
