class User < ApplicationRecord
  # validates :student_no, format: { with: /\A20[0-9]{10}\z/, message: "学号格式为20开头的12位数字" }
  validates :name, format: { with: /\A.{1,45}\z/, message: "姓名格式不对" }
  validates :sex,
            presence: { message: "性别不能为空" },
            numericality: { only_integer: true, message: "性别格式不对" }
  validates :phone, format: { with: ~ /(^|\s)86[\s]+[1-9][0-9]{1,2}\s/, message: "电话格式不对" },
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
  before_create :check_student_no

  def check_student_no
    user = User.where(student_no: student_no).first
    if user
      errors.messages['error1'] = '帐号已经存在'
      throw :abort
    end
  end

  # 登录帐号密码验证 先不考虑验证码
  def check_login(student_no, password, code)
    res = {}
    user = User.where(student_no: student_no).first
    if user.blank?
      code = 404
      message = '帐号不存在,请联系管理员'
    elsif user.status == 2
      code = 403
      message = '帐号被禁用,请联系管理员'
    elsif !check_password(password, user.password)
      code = 401
      message = '帐号或密码错误'
    else
      code = 200
      message = '帐号密码验证成功'
      res['user'] = user
    end
    res['code'] = code
    res['message'] = message
    res
  end

  def check_password(password, digest_password)
    Digest::SHA1.hexdigest(password) == digest_password
  end

  def edit_password(user, password_pre, password_new, password_again)
    res = {}
    if password_new.length < 6
      code = 201
      message = '密码至少为6位'
    elsif !check_password(password_pre, user.password)
      code = 201
      message = '原密码不对'
    elsif !(password_new == password_again)
      code = 201
      message = '新密码和确认密码不对'
    else
      if user.update(password: Digest::SHA1.hexdigest(password_new))
        code = 200
        message = '修改成功'
      else
        code = 201
        message = '修改失败'
      end
    end
    res['code'] = code
    res['message'] = message
    res
  end
end
