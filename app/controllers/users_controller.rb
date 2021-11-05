class UsersController < ApplicationController
  def signup
  end



  def create
    #取出哈希param中的name、email等元素
    name = params[:name]
    student_no = params[:student_no]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    sex = params[:sex]
    phone = params[:phone]
    #从账户表中查找是否有相同的email，有相同的email说明该邮箱已经被注册过了
    user = User.find_by(student_no:student_no)
    #先判断name、student_no是否为空
    if name.blank? || student_no.blank?
      render json: {code: 201, errors: '学号或姓名不能为空'}
    elsif password.blank?
      render json: {code: 201, errors: '密码不能为空'}
    #判断account是否存在，即是否存在相同邮箱的用户
    elsif user
      render json: {code: 201,  errors: '学号已注册'}
    #判断密码和确认密码是否一致
    elsif password != password_confirmation
      render json: {code: 201, errors: '两次密码输入不一致'}
    #上面条件全部不符合，会进入else语句，将填写的信息保存到数据中
    else
      data = {
        student_no: student_no,
        name: name,
        sex: sex,
        phone: phone,
        system_admin: 1,
        status: 1,
        password: Digest::SHA1.hexdigest(password),
        create_time: Time.now.inspect,
        update_time: Time.now.inspect
    }
      res =  User.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '注册成功'}
      end
    end
  end


end
