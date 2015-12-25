require 'test_helper'

class AssessmentWeightsControllerTest < ActionController::TestCase
  setup do
    @assessment_weight = assessment_weights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assessment_weights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assessment_weight" do
    assert_difference('AssessmentWeight.count') do
      post :create, assessment_weight: {  }
    end

    assert_redirected_to assessment_weight_path(assigns(:assessment_weight))
  end

  test "should show assessment_weight" do
    get :show, id: @assessment_weight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assessment_weight
    assert_response :success
  end

  test "should update assessment_weight" do
    patch :update, id: @assessment_weight, assessment_weight: {  }
    assert_redirected_to assessment_weight_path(assigns(:assessment_weight))
  end

  test "should destroy assessment_weight" do
    assert_difference('AssessmentWeight.count', -1) do
      delete :destroy, id: @assessment_weight
    end

    assert_redirected_to assessment_weights_path
  end
end
