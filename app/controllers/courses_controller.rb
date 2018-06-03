class CoursesController < InheritedResources::Base
	
  before_action :authenticate_user!,only: [:new ,:edit, :destroy]

  def create
    @course = current_user.courses.create(course_params)
    @course.save
    redirect_to courses_path
  end
 
  private

    def course_params
      params.require(:course).permit(:title ,:user_id)
    end
end

