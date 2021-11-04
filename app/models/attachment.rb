class Attachment < ApplicationRecord
  validates :status, presence: { message: "状态不能为空" },
            numericality: { only_integer: true, message: "状态格式不对" }
  scope :by_name_search, -> name { where("name like ?", "%#{name}%") if name.present? }
  scope :by_status, -> { where(status: 1) }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
  scope :by_create_time, -> { order("create_time desc") }
end