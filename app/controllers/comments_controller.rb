class CommentsController < ApplicationController

  def create
    @user = current_user
    @comment = current_user.comments.new(comment_params)
    if @comment.save
        redirect_to question_path(commented_on)
    else
        redirect_to question_path(commented_on)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end

  def commented_on
    if params[:comment][:commentable_type] == "Question"
      return @comment.commentable_id
    else
      return @comment.commentable.question.id
    end
  end

end
