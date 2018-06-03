class LecturesController < InheritedResources::Base

  before_action :authenticate_user!,only: [:spam, :upvote, :downvote, :new ,:edit, :destroy]

  def spam
    @lecture = Lecture.find(params[:id])
    current_user.lectures << Lecture.find(params[:id])
    redirect_to lecture_path(@lecture)
  end 

  def upvote 
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_by current_user
    redirect_to lecture_path(@lecture)
  end  

  def downvote
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_by current_user
    redirect_to lecture_path(@lecture)
  end

  def index
  	@course = Course.find(params[:course_id])
  	@lectures = @course.lectures
  end
	
  def new
    @course = Course.find(params[:course_id])
    @lecture = @course.lectures.build
  end

  def create
    @course = Course.find(params[:course_id])
    @lecture = @course.lectures.create(lecture_params)
    @lecture.user_id = current_user.id
    @lecture.save
    redirect_to course_lectures_path
  end

  def show
    @lecture = Lecture.find(params[:id])
    @users = Lecture.find(params[:id]).users
    @ids = @users.ids
  end
    
  def edit
    @course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to course_lectures_path
  end
  
  private
   
    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id ,:user_id)
    end
end

