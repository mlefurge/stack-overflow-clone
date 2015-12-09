class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
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
  end

  def update
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :content)
  end

end
