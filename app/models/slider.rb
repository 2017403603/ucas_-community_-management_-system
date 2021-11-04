class Slider < ApplicationRecord
  validates :random_name, format: { with: /\A.{1,45}\z/, message: "图片格式不对" }
  validates :href, format: { with: /\A.{1,100}\z/, message: "链接不对" }
  validates :sort,
            presence: { message: "排序不能为空" },
            numericality: { only_integer: true, message: "排序只能为整数" }
  validates :status, presence: { message: "状态不能为空" },
            numericality: { only_integer: true, message: "状态格式不对" }
  scope :by_status, -> { where(status: 1) }
  scope :by_sort, -> { order(:sort) }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
end