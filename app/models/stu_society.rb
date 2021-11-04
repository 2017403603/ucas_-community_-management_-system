class StuSociety < ApplicationRecord

  validates :name,
            presence: { message: "名称不能为空" },
            length: { in: 1..45, message: "名称长度在1-45个字符内" }
  validates :sort,
            presence: { message: "排序不能为空" },
            numericality: { only_integer: true, message: "排序只能为整数" }
  validates :status,
            presence: { message: "状态不能为空" },
            numericality: { only_integer: true, message: "状态只能为整数" }
  validates :society_type,
            presence: { message: "类型不能为空" },
            numericality: { only_integer: true, message: "类型只能为整数" }

  scope :by_name_search, -> name { where("name like ?", "%#{name}%") if name.present? }
  scope :by_status, -> { where(status: 1) }
  scope :by_sort, -> { order(:sort) }
end
