require 'test_helper'

class AssingmentsControllerTest < ActionController::TestCase
  setup do
    @assingment = assingments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assingments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assingment" do
    assert_difference('Assingment.count') do
      post :create, assingment: {  }
    end

    assert_redirected_to assingment_path(assigns(:assingment))
  end

  test "should show assingment" do
    get :show, id: @assingment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assingment
    assert_response :success
  end

  test "should update assingment" do
    patch :update, id: @assingment, assingment: {  }
    assert_redirected_to assingment_path(assigns(:assingment))
  end

  test "should destroy assingment" do
    assert_difference('Assingment.count', -1) do
      delete :destroy, id: @assingment
    end

    assert_redirected_to assingments_path
  end
end
