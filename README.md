# 大学生社团信息管理系统
## 部署
 - 安装rvm   1.29.3
 - 安装ruby  2.4.1
 - 安装bundle 1.16.1 
 - 根目录下 bundle install
 - 运行sql文件,导入数据到数据库[/db/Dump20180318.sql]
 - 修改数据库配置文件,配置帐号密码
 
## 初始使用说明
 - 开发环境启动 bundle exec rails s, 浏览器访问 127.0.0.1:3000
 - 后台地址 127.0.0.1:3000/admin [账号：201430350301 密码：123321]
 
## 网站后台用到的session说明
 - session[:user] 当前登录的用户信息
 - session[:society_id] 当前用户所在社团
 - session[:societies]  当前用户加入的有效社团
 - session[:menu_list_id] 控制左边菜单栏默认选中
 - session[:role] 当前用户的角色,共3种角色["user","society","system"]
 - session[:allow_controller] 当前用户允许访问的控制器数组
 
## 网站前台用到的session说明
 - session[:index_society] 当前的社团信息

## 网站的权限说明
 - 一共有4个大模块:[个人中心, 我的社团, 社团管理, 系统设置]
 - 普通用户可访问:[个人中心, 我的社团]
 - 社团管理员可访问:[个人中心, 我的社团, 社团管理]
 - 系统管理员可访问:[个人中心, 我的社团, 社团管理, 系统设置]
  
## 封装的doRequest函数说明
 - 通过ajax访问,实现获取,新增,修改,删除数据,支持GET,POST,PUT,DELETE
 - 参数格式 doRequest(_this, url, type, data, callback) 
 - 回调函数 callback
 - 后台返回数据格式 json
   1. 成功无数据返回(新增,修改,删除...) {code: 200, message: '...成功'}
   1. 成功有数据返回(新增,修改,删除...) {code: 200, message: '...成功', data: {}}
   1. 失败 {code: 非200, errors: []/string}
   1. 有callback时,操作成功后会调用callback函数
   
## 测试提交下git代码

## 配置rails的job，用sidekiq做队列
- 添加gem gem 'sidekiq' 并bundle install
- config.active_job.queue_adapter = :sidekiq   
- 安装redis并启动
- 启动sidekiq bundle exec sidekiq 默认端口为6379
- 创建一个job bin/rails generate task queue_job test
- 运行job，测试
   