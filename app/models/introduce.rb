class Introduce < ApplicationRecord
  scope :by_status, -> { where(status: 1) }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
  scope :find_society_introduce, -> society_id { where("society_id = ? and status = 1", society_id) }
end