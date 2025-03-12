class Decision < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_many :documents, as: :documentable
  has_many :votes

  def already_voted_by?(user)
    self.votes.find_by(user: user).present?
  end

  def vote_of(user)
    self.votes.find_by(user: user)
  end
end


# @decision.already_voted_by?(current_user)
# @decision.vote_of(curernt_user)
