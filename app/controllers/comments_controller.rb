class CommentsController < InheritedResources::Base
  
  before_action :authenticate_user!,only: [:new ,:edit, :destroy]

  def index
    @lecture = Lecture.find(params[:lecture_id])
    @comments = @lecture.comments
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.build
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to lecture_comments_path
  end

  def edit
    @lecture = Lecture.find(params[:lecture_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to([@comment.lecture, @comment], :notice => 'Comment was successfully updated.')   
  end

  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.find(params[:id])
    @comment.destroy
    redirect_to lecture_comments_path
  end
  
  private

  def comment_params
    params.require(:comment).permit(:text ,:lecture_id ,:user_id)
  end
  
end

