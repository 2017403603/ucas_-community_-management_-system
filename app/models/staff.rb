class Staff < ApplicationRecord
  validates :user_id, format: { with: /\A[0-9]+\z/, message: "用户格式不对" }
  validates :department_id, format: { with: /\A[0-9]+\z/, message: "部门格式不对" }
  validates :job_id, format: { with: /\A[0-9]+\z/, message: "职位格式不对" }
  validates :start_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "任职开始格式不对" }
  validates :end_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "任职结束格式不对" }
  validates :status, presence: { message: "状态不能为空" },
            numericality: { only_integer: true, message: "状态格式不对" }
  scope :by_name_phone_search, -> name { where("(name like ? or student_no like ?)", "%#{name}%", "%#{name}%") if name.present? }
  scope :by_status, -> { where(status: 1) }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
  scope :find_user_society_ids, -> user_id { select("society_id").where("user_id = ? and status = 1", user_id).group("society_id")}
  # 社员通讯录查询
  scope :get_staffs_info, -> { select("staffs.*, users.mail,users.phone").joins("inner join users on staffs.user_id = users.id") }
  # 判断当前用户是否社团管理员
  scope :society_admin?, -> society_id, user_id { where("society_id = ? and user_id = ? and society_admin = 1 and status = 1", society_id, user_id).limit(1) }
end
