class QuestionsController < ApplicationController

  def index
    @questions = Question.order(:created_at).page params[:page]
  end

  def new
  end

  def create
    user = current_user
    question = user.questions.new(question_params)
    if question.save
      question.associate_to_tags!(tag_params[:tags].split(","))
      redirect_to question_path(question)
    else
      @errors = question.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
    @question = Question.find(params[:id])
    # TODO - add @answer
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.assign_attributes(question_params)
    if @question.save
      @question.associate_to_tags!(tag_params[:tags].split(","))
      redirect_to question_path(@question)
    else
      @errors = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    @question = Question.includes(:answers, :question_tags,:comments).find(params[:id])
    Answer.destroy_all(:question_id => @question.id)
    Comment.destroy_all(:commentable_id => @question.id, commentable_type: "Question")
    QuestionTag.destroy_all(:question_id => @question.id)
    @question.destroy
    redirect_to root_path
  end



private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def tag_params
    params.require(:question).permit(:tags)
  end

end

