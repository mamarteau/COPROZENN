class Decision < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_many :documents, as: :documentable
  has_many :votes


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

end


# @decision.already_voted_by?(current_user)
# @decision.vote_of(curernt_user)
