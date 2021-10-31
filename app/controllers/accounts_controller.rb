class AccountsController < ApplicationController
  before_action :check_login, except:[:signup,:create_account,:login,:create_login,:logout]
  def login
  end

  def signup
      @account = Account.new
  end


  def create_account
    #取出哈希param中的name、email等元素
    name = params[:account][:name]
    email = params[:account][:email]
    password = params[:account][:password]
    password_confirmation = params[:account][:password_confirmation]
    school = params[:account][:school]
    num = params[:account][:num]
    #status为0，代表账号是激活状态；为1，代表账号是未激活状态
    status = 1
    #从账户表中查找是否有相同的email，有相同的email说明该邮箱已经被注册过了
    account = Account.find_by(email:email)
    #创建一个Account类的对象
    @account = Account.new
    #先判断name、email是否为空
    if name.blank? || email.blank?
      flash.notice = "用户名或者邮箱不能为空"
      render :signup
    #判断account是否存在，即是否存在相同邮箱的用户
    elsif account
      flash.notice = "邮箱已注册"
      render :signup
    #判断名字的长度是否大于5
    elsif name.length > 10
      flash.notice = "用户名长度不能大于5"
      render :signup
    #判断密码和确认密码是否一致
    elsif password != password_confirmation
      flash.notice = "两次密码输入不一致"
      render :signup
    #上面条件全部不符合，会进入else语句，将填写的信息保存到数据中
    else
      @account.status = status
      @account.name = name
      @account.email = email
      @account.password = Des.des_encode(password)
      @account.school = school
      @account.num  = num
      #.save保存成功时，返回true，失败时返回false
      boolean = @account.save
      #boolean为true时说明account保存成功
      if boolean
        flash.notice = "注册成功！请登录"
        redirect_to :login #注册成功，将页面重定向到登录页面
      else
        flash.notice = "注册失败！请重新注册"
        render :signup
      end
    end
  end

  def create_login
    #从params中取email、password的值
    #strip是去除字符串头部和尾部的空格的方法
    email = params[:email].strip
    password_html = params[:password].strip
    #通过email查找用户
    account = Account.find_by(email:email)
    #如果用户存在，进行下面判断
    if account
      #用户的身份为管理员，状态为激活，密码正确，可以登录成功
      if account.role == 1 && account.status == 0
        #数据库存储的密码解密与用户输入的密码作对比
        if Des.des_decode(account.password).to_s == password_html
          flash.notice = "登录成功！"
          redirect_to :root
        else
          flash.notice = "用户名密码错误!"
          render :login
        end
      #如果用户为管理员身份，状态为未激活，需要提示激活信息
      # elsif account.role == 1 && account.status == 1
      #   flash.notice = "您的用户未激活,请超级管理员激活后再重新登录"
      #   render :login
      #其他类型的客户，密码正确，可以登录
      else
        if Des.des_decode(account.password).to_s == password_html
          session[:account_id] = account.id
          flash.notice = "登录成功！"
          redirect_to :root
        else
          flash.notice = "用户名密码错误!"
          render :login
        end
      end
    #如果用户不存在，需要提示用户去注册
    else
      flash.notice = "用户不存在，请先注册"
      render :login
    end   
  end
  

  def check_login
    @current_user ||= session[:account_id] &&     Account.find(session[:account_id])
  end
  

  end

