class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to question_path(voted_on)
    end

  end

  private

  def vote_params
    params.require(:vote).permit(:value, :user_id, :votable_type, :votable_id)
  end

  def voted_on
    if params[:vote][:votable_type] == "Question"
      return @vote.votable_id
    else
      return @vote.votable.question.id
    end
  end

end
