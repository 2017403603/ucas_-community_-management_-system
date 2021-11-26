class Con < ApplicationRecord
  # validates :society_id, format: { with: /\A[0-9]*\z/, message: "社团格式不对" },
  #           unless: Proc.new{ |a| a.society_id.blank? }  
  # validates :student_no, format: { with: /\A20[0-9]{10}\z/, message: "学号格式为20开头的12位数字" }
  # validates :name, format: { with: /\A.{1,45}\z/, message: "姓名格式不对" }
  # validates :start_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "活动开始日期格式不对" },
  #           unless: Proc.new{ |a| a.start_time.blank? }
  # validates :status, presence: { message: "状态不能为空" },
  #           numericality: { only_integer: true, message: "状态格式不对" }
  # validates :create_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "活动发布日期格式不对" },
  #           unless: Proc.new{ |a| a.create_time.blank? }
  
    scope :by_name_student_no_search, -> name { where("(name like ? or student_no like ?)", "%#{name}%", "%#{name}%") if name.present? }
    scope :by_status, -> { where(status: 1) }
    scope :by_activity_id, -> activity_id {where("activity_id = ?", activity_id)}
    before_create :check_student_no
  
    def check_student_no
      user = Con.where(student_no: student_no).first
      if user
        errors.messages['error1'] = '帐号已经存在'
        throw :abort
      end
    end
end
  