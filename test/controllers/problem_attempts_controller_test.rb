require 'test_helper'

class ProblemAttemptsControllerTest < ActionController::TestCase
  setup do
    @problem_attempt = problem_attempts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_attempts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_attempt" do
    assert_difference('ProblemAttempt.count') do
      post :create, problem_attempt: {  }
    end

    assert_redirected_to problem_attempt_path(assigns(:problem_attempt))
  end

  test "should show problem_attempt" do
    get :show, id: @problem_attempt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_attempt
    assert_response :success
  end

  test "should update problem_attempt" do
    patch :update, id: @problem_attempt, problem_attempt: {  }
    assert_redirected_to problem_attempt_path(assigns(:problem_attempt))
  end

  test "should destroy problem_attempt" do
    assert_difference('ProblemAttempt.count', -1) do
      delete :destroy, id: @problem_attempt
    end

    assert_redirected_to problem_attempts_path
  end
end
