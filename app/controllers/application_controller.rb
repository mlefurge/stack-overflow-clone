class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user, :logged_in?, :up_voted_already?, :down_voted_already?

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def up_voted_already?(type)
    votes = type.votes.all
    if votes.exists?(:user_id => current_user.id)
      votes.where(:user_id => current_user.id).sum(:value) > 0
    else
      false
    end
  end

  def down_voted_already?(type)
    votes = type.votes.all
    if votes.exists?(:user_id => current_user.id)
      votes.where(:user_id => current_user.id).sum(:value) < 0
    else
      false
    end
  end

  protect_from_forgery with: :exception
end
