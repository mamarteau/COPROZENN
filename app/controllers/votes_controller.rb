class VotesController < ApplicationController

  def create
    @decision = Decision.find(params[:decision_id])
    @vote = Vote.new(value: params[:value])
    @vote.user = current_user
    @vote.decision = @decision

    if @vote.save
      redirect_to vote_decision_path(@decision)
    else
      render "meetings/show"
    end
  end
end

