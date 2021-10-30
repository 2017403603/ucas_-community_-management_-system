Rails.application.routes.draw do

# 制定网站首页的路径
  root 'home#index'
  get 'login' => 'accounts#login' #用户登录
  get 'signup' => 'accounts#signup' #用户注册

end
