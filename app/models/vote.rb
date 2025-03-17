class Vote < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :decision
  belongs_to :user

  validates :user, uniqueness: { scope: :decision }

  after_create :broadcast_result

  private

  def broadcast_result
    broadcast_replace_to dom_id(self.decision),
                        partial: "decisions/result",
                        target: "#{dom_id(self.decision)}_result",
                        locals: { decision: self.decision }
  end
end
