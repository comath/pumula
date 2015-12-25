require 'test_helper'

class StudentAttemptsControllerTest < ActionController::TestCase
  setup do
    @student_attempt = student_attempts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_attempts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_attempt" do
    assert_difference('StudentAttempt.count') do
      post :create, student_attempt: {  }
    end

    assert_redirected_to student_attempt_path(assigns(:student_attempt))
  end

  test "should show student_attempt" do
    get :show, id: @student_attempt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_attempt
    assert_response :success
  end

  test "should update student_attempt" do
    patch :update, id: @student_attempt, student_attempt: {  }
    assert_redirected_to student_attempt_path(assigns(:student_attempt))
  end

  test "should destroy student_attempt" do
    assert_difference('StudentAttempt.count', -1) do
      delete :destroy, id: @student_attempt
    end

    assert_redirected_to student_attempts_path
  end
end
