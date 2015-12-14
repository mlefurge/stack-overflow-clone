class UsersController < ApplicationController

  def index


  end

  def show
    @questions = Question.where(user: current_user)
    @questions_answered = current_user.questions_answered
  end


end
