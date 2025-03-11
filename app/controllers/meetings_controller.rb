class MeetingsController < ApplicationController
  # before_action :set_meeting, only: [:index, :show, :update, :edit, :new, :create]

  def index
    @meetings = Meeting.all
  end

  # def show

  # end

  # def new
  #   @meeting = Meeting.new
  # end

  # def create
  #   @meeting = Meeting.new(meeting_params)
  #   @meeting.user = current_user
  #   @meeting.coproperty = current_user.coproperty_id
  #   if @meeting.save
  #     redirect_to meeting_path(@meeting)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit

  # end

  # def update

  # end

  # private

  # def meeting_params
  #   params.require(:meeting).permit(:title, :date, :link, :description)
  # end

  # def set_meeting
  #   @meeting = Meeting.find(params[:id])
  # end
end
