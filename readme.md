# 果壳社团信息管理系统

本项目为研究生高级软件工程课程大作业，原开发集成码云地址为：[https://gitee.com/M1zuki/ucas_-community_-management_-system.git](https://gitee.com/M1zuki/ucas_-community_-management_-system.git)后迁移到github中。

本系统软件开发详细文档为：结题报告.pdf

可下载查看详细开发文档：开题报告.pptx、中期报告.pptx、结题报告.pdf

# ***\*5.1系统创新点\****

本系统的创新点可以归纳为以下几个层面：

 

**1.** ***\*软件开发方法层面:\****

本系统软件开发方法抛弃传统P&D方法，采用敏捷软件开发方法，用户需求使用User-story的方式记录，使用UI草图的方式设计页面。

**2.** ***\*软件开发工具层面：\****

使用了CI/CD工具git和gitee进行持续开发；在协同开发的过程中，使用了飞书来沟通交流、发布任务流水、精细任务划分；使用了用先进的UI设计工具摹客设计精美的UI草图。

**3.** ***\*功能设计层面\****

本系统将对社团的管理和对社员的管理通过申请加入社团、申请社团活动等功能联系到一起，聚合为一个系统，且各个模块相互独立。整个系统对内开放用户注册登录，不像很多官方网站，只提供对外发布内容，不提供对内注册；

系统功能和权限根据用户群体等级进行划分，普通游客、普通用户、社团管理员、系统管理员功能权限逐级递增，且用户功能权限可以由最高等级用户设置；

**4.** ***\*非功能层面\****

考虑数据库安全性，每个数据库写入请求都有事务回滚机制；考虑用户账号安全性，用户密码在注册写入数据库之前均加密处理；本系统有多个功能设计层面耦合，同时也考虑系统二次开发和维护升级，系统代码编写时采用了多种软件设计模式，如抽象工厂模式、代理模式、观察者模式等。



## 部署
 - 安装ruby  2.4.1
 - 安装bundle 1.16.1 
 - 根目录下 bundle install
 - 运行sql文件,导入数据到数据库[/db/society20211118.sql]
 - 修改数据库配置文件,配置帐号密码

## 初始使用说明
 - 开发环境启动 bundle exec rails s, 浏览器访问 127.0.0.1:3000
 - 后台地址 127.0.0.1:3000/admin [账号：201430350301 密码：123321]

## session信息说明
 - session[:user] 当前登录的用户信息
 - session[:society_id] 当前用户所在社团
 - session[:societies]  当前用户加入的有效社团
 - session[:menu_list_id] 控制左边菜单栏默认选中
 - session[:role] 当前用户的角色,共3种角色["user","society","system"]
 - session[:allow_controller] 当前用户允许访问的控制器数组
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