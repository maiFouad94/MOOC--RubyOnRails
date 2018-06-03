require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @course = courses(:one)
    @user = users(:one)
  end



  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

 
  test "should update course" do
    patch course_url(@course), params: { course: { title: @course.title } }
    assert_redirected_to course_url(@course)
  end

  
  
end
