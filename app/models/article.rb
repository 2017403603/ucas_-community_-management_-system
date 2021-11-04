class Article < ApplicationRecord
  validates :title,
            presence: { message: "标题不能为空" },
            length: { in: 1..45, message: "名称长度在1-45个字符内" }
  scope :by_name_search, -> name { where("title like ?", "%#{name}%") if name.present? }
  scope :by_status, -> { where(status: 1) }
  scope :by_create_time, -> { order("create_time desc") }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
end