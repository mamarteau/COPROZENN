class DocumentsController < ApplicationController
  # before_action :authenticate_user!, only: [:index, :show, :new, :create]
  before_action :set_document, only: [:show]

  def index
    @documents = Document.all
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
    if @document.save
      redirect_to document_path(@document)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:name, :tag, :file)
  end

end
