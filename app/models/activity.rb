class Activity < ApplicationRecord
  validates :name,
            presence: { message: "名称不能为空" },
            length: { in: 1..45, message: "名称长度在1-45个字符内" }
  validates :apply_start_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "报名开始日期格式不对" }
  validates :apply_end_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "报名结束日期格式不对" }
  validates :status, presence: { message: "状态不能为空" },
            numericality: { only_integer: true, message: "状态格式不对" }
  scope :by_name_search, -> name { where("name like ?", "%#{name}%") if name.present? }
  scope :by_status, -> { where(status: 1) }
  scope :by_create_time, -> { order("create_time desc") }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
  after_validation :check_time

  # 检查开始和截止的时间是否合法
  def check_time
    if self.errors.messages.blank?
      if apply_start_time >= apply_end_time
        self.errors.messages[:time] = '报名开始时间不能大于等于结束时间'
      end
    end
  end
end