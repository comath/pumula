require 'test_helper'

class CourseInstancesControllerTest < ActionController::TestCase
  setup do
    @course_instance = course_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_instance" do
    assert_difference('CourseInstance.count') do
      post :create, course_instance: {  }
    end

    assert_redirected_to course_instance_path(assigns(:course_instance))
  end

  test "should show course_instance" do
    get :show, id: @course_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_instance
    assert_response :success
  end

  test "should update course_instance" do
    patch :update, id: @course_instance, course_instance: {  }
    assert_redirected_to course_instance_path(assigns(:course_instance))
  end

  test "should destroy course_instance" do
    assert_difference('CourseInstance.count', -1) do
      delete :destroy, id: @course_instance
    end

    assert_redirected_to course_instances_path
  end
end
