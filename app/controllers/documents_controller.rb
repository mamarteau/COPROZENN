class DocumentsController < ApplicationController
  # before_action :authenticate_user!, only: [:index, :show, :new, :create]
  before_action :set_document, only: [:show]
  before_action :set_documentable, only: [:new, :create]

  def index
    @documents = Document.where(coproperty: current_user.coproperty)
    @title = "Mes documents"

  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user
    @document.coproperty_id = current_user.coproperty_id
    @document.documentable = @documentable
    if @document.save
      redirect_to @documentable || @document
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def set_documentable
    @documentable = if params[:meeting_id].present?
      Meeting.find(params[:meeting_id])
    elsif params[:decision_id].present?
      Decision.find(params[:decision_id])
    end
  end

  def document_params
    params.require(:document).permit(:name, :tag, :file, :meeting_id, :decision_id)
  end
end
