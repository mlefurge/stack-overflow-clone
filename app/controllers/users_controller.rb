class UsersController < ApplicationController

  def index
    @users = User.order(questions_count: :desc).limit(15)
  end

  def show
    @user = User.find(params[:id])
    @questions = Question.where(user: @user)
    @questions_answered = @user.questions_answered
  end


  def top
    case params[:sort]
    when "questions"
      @users = User.where.not(questions_count: nil).order(questions_count: :desc).limit(15)
    when "answers"
      @users = User.where.not(answers_count: nil).order(answers_count: :desc).limit(15)
    when "recent"
      @users = User.recently_asked
    end
    render partial: 'top', layout: false, locals: { users: @users }
  end

end
