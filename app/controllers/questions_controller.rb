class QuestionsController < ApplicationController

  def index
    @questions = Question.all
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


end

