class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    render layout: false
  end

  def create
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(content: answer_params[:content], user_id: @user.id)
    if @answer.save
      redirect_to question_path(@question)
    else
      @errors = @answer.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.assign_attributes(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      @errors = @answer.errors.full_messages
      render :edit
    end
  end

  def destroy
    @answer = Answer.includes(:comments).find(params[:id])
    Comment.destroy_all(:commentable_id => @answer.id, commentable_type: "Answer")
    @answer.destroy
    redirect_to question_path(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :content)
  end

end
