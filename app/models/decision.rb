class Decision < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :meeting #, touch: true
  has_many :documents, as: :documentable
  has_many :votes

  after_save :broadcast_vote, if: :opened?
  after_save :broadcast_meeting, if: :closed?

  enum :status, {
    pending: 0,
    opened: 1,
    closed: 2
  }


  attr_accessor :document_name, :document_tag


  def already_voted_by?(user)
    self.votes.find_by(user: user).present?
  end

  def vote_of(user)
    self.votes.find_by(user: user)
  end

  def for
    self.votes.where(value: true).count
  end

  def against
    self.votes.where(value: false).count
  end

  private

  def broadcast_vote
    broadcast_replace_to dom_id(self.meeting),
                        partial: "decisions/vote",
                        target: dom_id(self.meeting),
                        locals: { decision: self }
  end

  def broadcast_meeting
    broadcast_replace_to dom_id(self.meeting),
                        partial: "meetings/show",
                        target: dom_id(self.meeting),
                        locals: { meeting: self.meeting }
  end

end


# @decision.already_voted_by?(current_user)
# @decision.vote_of(curernt_user)
