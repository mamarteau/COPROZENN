class DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :edit, :update, :close, :vote, :open]
  before_action :authenticate_user!, only: [:create, :update]

  def index
    @meeting = Meeting.find(params[:meeting_id])
    @decisions = @meeting.decisions
  end

  def show
  end

 def new
  @meeting = Meeting.find(params[:meeting_id])
  @decision = Decision.new
  @document = Document.new
  @title = "Créer une décision"
 end

 def create
  @meeting = Meeting.find(params[:meeting_id])
  @decision = Decision.new(decision_params)
  @decision.user = current_user
  @decision.meeting = @meeting
  if @decision.save
    if document_params[:file]
      @document = Document.create!(
        name: document_params[:document_name],
        tag: document_params[:document_tag],
        file: document_params[:file],
        user: current_user,
        coproperty: current_user.coproperty
      )
      @decision.documents << @document
    end
    redirect_to meeting_path(@meeting)
  else
    render :new, status: :unprocessable_entity
  end
 end


  def edit
  end

  def update
    if @decision.update(decision_params)
      redirect_to decision_path(@decision), notice: "Décision mise à jour."
    else
      render :edit
    end
  end

  def close
    result = @decision.votes.where(value: true).count > @decision.votes.where(value: false).count
    @decision.accepted = result
    @decision.closed!
    # Pas de render ou de redirect car un stream actualise la page
  end

  def open
    @decision.opened!
    # Pas de render ou de redirect car un stream actualise la page
  end

  def vote
    @vote = Vote.new(value: params[:vote_value] == "for")
    @vote.user = current_user
    @vote.decision = @decision
    @vote.save
        flash[:notice] = "Votre vote a été pris en compte."

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def decision_params
    params.require(:decision).permit(:title, :description)
  end

   def document_params
    params.require(:decision).permit(:file, :document_tag, :document_name)
   end

   def set_decision
     @decision = Decision.find(params[:id])
   end
end
