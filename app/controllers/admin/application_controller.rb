module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login
    before_action :menu_list
    before_action :power_control
    before_action :find_menu_list
    layout "admin/layouts/application"

    private
    def require_login
      unless current_user
        flash[:notice] = '还未登录'
        redirect_to admin_sessions_new_path
      end
    end

    # 权限控制,根据角色对访问的链接判断
    def power_control
      unless session['user']
        return
      end
      controller = params[:controller]
      allow_controller = current_allow_controller
      if allow_controller.first == "all"
        return
      end
      allow_controller.each do |e|
        return if controller.include?(e)
      end
      redirect_to "/403.html"
    end

    # 左边菜单栏,只有两层关系
    def menu_list
      unless session['user']
        return
      end
      role = current_user_role
      if role == 'system'
        pids = [1,2,3,4]
      elsif role == 'society'
        pids = [1,2,3]
      else
        pids = [1,2]
      end
      list_data = MenuList.by_status.by_pids(pids).by_sort
      @list_data = get_cate_level(list_data, 0)
    end

    # 递归
    def get_cate_level(list_data, id)
      arr = []
      list_data.each do |e|
        temp = e.attributes.dup
        if temp['pid'] == id
          temp['child'] = get_cate_level(list_data, e.id)
          arr << temp
        end
      end
      arr
    end

    # 当前用户
    def current_user
      session[:user]
    end

    # 用户角色['system', 'society', 'user']
    def current_user_role
      return session[:role] if session[:role]
      if session["user"]["system_admin"] == 1
        role = 'system'
      elsif !Staff.society_admin?(session["society_id"], session["user"]["id"]).blank?
        role = 'society'
      else
        role = 'user'
      end
      session[:role] = role
      role
    end

    # 当前用户可允许访问的控制器
    def current_allow_controller
      return session[:allow_controller] if session[:allow_controller]
      role = current_user_role
      allow_controller =
      case role
        when "system"
          ["all"]
        when "society"
          ["academies", "activities", "articles", "attachments", "departments", "files", "levels", "staffs", "sliders", "introduces", "my", "sessions", "votes"]
        when "user"
          ["files", "my", "sessions", "votes"]
        else
          []
      end
      session[:allow_controller] = allow_controller
      allow_controller
    end

    # 通过session控制左边菜单栏的默认显示和显示当前模块
    def find_menu_list
      menu_list_id = params[:menu_id] || session[:menu_id] || 5
      session[:menu_id] = menu_list_id
      sub = MenuList.find(menu_list_id)
      par = MenuList.find(sub.pid)
      @sub_name = sub.name
      @par_name = par.name
    end
  end
end
