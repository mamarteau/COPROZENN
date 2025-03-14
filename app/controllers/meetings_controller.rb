class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :update, :edit]

  def index
    @meetings = Meeting.all
    @title = "Mes meetings"
  end

  def show
    @decisions = @meeting.decisions # - @meeting.decisions.joins(:votes).where(user: current_user).uniq
  end

  def new
    @meeting = Meeting.new
    @document = Document.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @meeting.coproperty_id = current_user.coproperty_id
    if @meeting.save
      @document = Document.create!(
        name: document_params[:document_name],
        tag: document_params[:document_tag],
        file: document_params[:file],
        user: current_user,
        coproperty: current_user.coproperty
      )
      @meeting.documents << @document
      redirect_to meeting_path(@meeting)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @meeting.update(meeting_params)
    redirect_to meeting_path(@meeting), notice: "Meeting mise à jour."

    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :date, :link, :description)
  end

  def document_params
    params.require(:meeting).permit(:file, :document_tag, :document_name)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
