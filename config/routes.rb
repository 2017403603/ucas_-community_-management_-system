Rails.application.routes.draw do
  get 'users/signup'
  post'users/signup', to:'users#create'
  root 'index/index#index'
  get '/admin', to: 'admin/my#index'
  namespace :admin do
    # 无需登录
    get '/sessions/new', to: 'sessions#new'
    get '/sessions/destroy', to: 'sessions#destroy'
    post '/sessions/create', to: 'sessions#create'
    # 普通用户
    get '/my', to: 'my#index'
    get '/my/edit', to: 'my#edit'
    put '/my/edit', to: 'my#update'
    get '/my/password', to: 'my#password'
    put '/my/password', to: 'my#password_update'
    get '/my/society_change/:id', to: 'my#society_change'
    get '/my/staff', to: 'my#staff'
    get '/my/level', to: 'my#level'
    get '/my/article', to: 'my#article'
    get '/my/activity', to: 'my#activity'
    get '/my/board', to: 'my#board'
    post '/my/upload', to: 'files#user_pic_upload'
    get '/my/get_academy_with_majors', to: 'my#get_academy_with_majors'
    post '/votes/vote/:id', to: 'votes#vote'
    resources :votes
    # 社团管理员
    get '/academies/get_academy_with_majors', to: 'academies#get_academy_with_majors'
    get '/departments/get_department_with_jobs', to: 'departments#get_department_with_jobs'
    get '/staffs/get_users', to: 'staffs#get_users'
    post '/articles/upload', to: 'files#article_file_upload'
    post '/societies/upload', to: 'files#society_pic_upload'
    resources :staffs
    resources :departments
    resources :levels
    resources :articles
    resources :activities
    resources :attachments
    resources :sliders
    resources :introduces
    # 系统管理员
    resources :societies
    resources :users
    resources :academies

  end

  # 前台路由
  namespace :index do
    get '/index', to: 'index#index'
    get '/article', to: 'index#article'
    get '/activity', to: 'index#activity'
    get '/attachment', to: 'index#attachment'
    get '/society', to: 'index#society'
    put '/society/joinSociety', to: 'index#join_society'
    put '/society/joinSociety/:id', to: 'index#join_society'
    put '/activity/joinActivity', to: 'index#join_activity'
    get '/change/:id', to: 'index#change'
    get '/article/:id', to: 'index#article_detail'
    get '/society/:id', to: 'index#society_detail'
    get '/activity/:id', to: 'index#activity_detail'
    get '/get_societies', to: 'index#get_societies'
    
  end
end
