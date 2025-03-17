class Meeting < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :coproperty
  has_many :documents, as: :documentable
  has_many :decisions
  after_touch :broadcast_vote

  attr_accessor :document_name, :document_tag

  def over?
    # decisions.all? { |decision| decision.closed? }
    decisions.present? && decisions.all?(&:closed?)
  end

  private

  def broadcast_vote
    binding.pry
    decision = decisions.find_by(status: :opened)
    broadcast_replace dom_id(@meeting),
                        partial: "decisions/vote",
                        target: dom_id(@meeting),
                        locals: { decision: decision }
  end
end
