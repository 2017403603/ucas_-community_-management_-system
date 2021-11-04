class VoteRecord < ApplicationRecord
  scope :by_user_id, -> user_id {where("user_id = ?", user_id)}
end
