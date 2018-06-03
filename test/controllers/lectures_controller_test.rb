require 'test_helper'

class LecturesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

  setup do
    @lecture = lectures(:one)
    @user = users(:one)

  end
  test "should spam lecture" do
    sign_in @user
    post spam_lecture_path(@lecture)
    assert_redirected_to lecture_url(@lecture)
  end

  test "should like lecture" do
    sign_in @user
    put like_lecture_path(@lecture)
    assert_redirected_to lecture_url(@lecture)
  end    

  test "should update lecture" do
    patch lecture_url(@lecture), params: { lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id } }
    assert_redirected_to lecture_url(@lecture)
  end

end
