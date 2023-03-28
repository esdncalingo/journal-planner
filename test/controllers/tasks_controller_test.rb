require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest

    setup do
        sign_in users(:one)
        @category = categories(:cat_one)
    end
    
    test "should get task index" do
        get category_tasks_path(category_id: @category.id)
        assert_response :success
    end
    
    test "can create new task" do
        get new_category_task_path(category_id: @category.id)
        assert_response :success
    
        post category_tasks_path, params:  { title: tasks(:one).title, description: tasks(:one).description, category_id: @category.id, status: tasks(:one).status } , as: :html
        assert_response :redirect
    end
    
    test "can edit task" do
        get edit_category_task_path(:id => tasks(:one), title: tasks(:one).title, category_id: @category.id)
        assert_response :success
    
        patch category_task_path, params: { task: { title: tasks(:one).title, description: tasks(:one).description, category_id: @category.id, status: "completed" } }
        assert_response :redirect
    
    end
    
    test "can view task" do
        get category_task_path(:id => tasks(:one).id, :category_id => @category.id)
        assert_response :success
    end

end