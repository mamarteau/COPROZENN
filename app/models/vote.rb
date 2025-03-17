class Vote < ApplicationRecord
  belongs_to :decision
  belongs_to :user

  validates :user, uniqueness: { scope: :decision }
end
