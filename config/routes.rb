Rails.application.routes.draw do

# 制定网站首页的路径
  root 'home#index'
  get 'login' => 'accounts#login' #用户登录
  get 'signup' => 'accounts#signup' #用户注册
  post 'create_account' => 'accounts#create_account'
  post 'create_login' => 'accounts#create_login'
end
