class DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :edit, :update]

  def index
    @decisions = Decision.all
  end


 def show
 end

 def new
   @decision = Decision.new
 end

 def create
  @decision = Decision.new(decision_params)
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
     params.require(:decision).permit(:user_id, :description, :meeting_id, :status)
   end

   def set_decision
     @decision = Decision.find(params[:id])
   end
end
