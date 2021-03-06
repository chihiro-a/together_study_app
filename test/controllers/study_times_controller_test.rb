require 'test_helper'

class StudyTimesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get study_times_new_url
    assert_response :success
  end

  test "should get create" do
    get study_times_create_url
    assert_response :success
  end

  test "should get index" do
    get study_times_index_url
    assert_response :success
  end

  test "should get edit" do
    get study_times_edit_url
    assert_response :success
  end
end
