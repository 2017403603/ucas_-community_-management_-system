class Level < ApplicationRecord
  validates :student_no, format: { with: /\A20[0-9]{10}\z/, message: "学号格式为20开头的12位数字" }
  validates :name, format: { with: /\A.{1,45}\z/, message: "姓名格式不对" }
  validates :start_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "会员开始日期格式不对" },
            unless: Proc.new{ |a| a.start_time.blank? }
  validates :end_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "会员结束日期格式不对" },
            unless: Proc.new{ |a| a.end_time.blank? }
  validates :sex,
            presence: { message: "性别不能为空" },
            numericality: { only_integer: true, message: "性别格式不对" }
  validates :phone, format: { with: /\A(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}\z/, message: "电话格式不对" },
            unless: Proc.new{ |a| a.phone.blank? }
  validates :academy_id, format: { with: /\A[0-9]*\z/, message: "学院格式不对" },
            unless: Proc.new{ |a| a.academy_id.blank? }
  validates :major_id, format: { with: /\A[0-9]*\z/, message: "专业格式不对" },
            unless: Proc.new{ |a| a.major_id.blank? }
  validates :mail, format: { with: /\A\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\z/, message: "邮箱格式不对" },
            unless: Proc.new{ |a| a.mail.blank? }
  validates :location, format: { with: /\A.{5,100}\z/, message: "宿舍地址格式不对" },
            unless: Proc.new{ |a| a.location.blank? }
  validates :native_place, format: { with: /\A.{1,100}\z/, message: "籍贯格式不对" },
            unless: Proc.new{ |a| a.native_place.blank? }
  validates :emer_name, format: { with: /\A.{1,45}\z/, message: "紧急联系人姓名格式不对" },
            unless: Proc.new{ |a| a.emer_name.blank? }
  validates :emer_phone, format: { with: /\A(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}\z/, message: "紧急联系人电话格式不对" },
            unless: Proc.new{ |a| a.emer_phone.blank? }
  validates :status, presence: { message: "状态不能为空" },
            numericality: { only_integer: true, message: "状态格式不对" }
  scope :by_name_student_no_search, -> name { where("(name like ? or student_no like ?)", "%#{name}%", "%#{name}%") if name.present? }
  scope :by_status, -> { where(status: 1) }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
  before_create :check_student_no

  def check_student_no
    user = Level.where(student_no: student_no).first
    if user
      errors.messages['error1'] = '帐号已经存在'
      throw :abort
    end
  end
end
