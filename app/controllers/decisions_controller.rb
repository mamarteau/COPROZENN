class DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:create, :update]

  def index
    @decisions = Decision.all
  end


 def show

 end

 def new
  @meeting = Meeting.find(params[:meeting_id])
  @decision = Decision.new
 end

 def create
  @meeting = Meeting.find(params[:meeting_id])
  @decision = Decision.new(decision_params)
  @decision.user = current_user
  @decision.meeting = @meeting
  if @decision.save
    redirect_to decision_path(@decision)
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


   private

   def decision_params
     params.require(:decision).permit(:description)
   end

   def set_decision
     @decision = Decision.find(params[:id])
   end
end
