require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "can create new category" do
    get new_category_url
    assert_response :success

    post categories_url, params: { category: { name: "New Category", user_id: users(:one).id } }
    assert_response :redirect
    follow_redirect!
  end

  test "can edit category" do
    get edit_category_path(:id => categories(:one).id, :name => categories(:one).name)
    assert_response :success

    patch category_path, params: { category: { name: "Category Updated" } }
    print categories(:one).name
    assert_response :success

  end

  test "can view category" do
    get categories_path(:id => categories(:one).id)
    assert_response :success
  end
  
end
