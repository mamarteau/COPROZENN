class VotesController < ApplicationController

  def create
    @decision = Decision.find(params[:decision_id])
    @vote = Vote.new(value: params[:value])
    @vote.user = current_user
    @vote.decision = @decision

    if @vote.save
      redirect_to meeting_path(@decision.meeting)
    else
      render "meetings/show"
    end
  end
end
