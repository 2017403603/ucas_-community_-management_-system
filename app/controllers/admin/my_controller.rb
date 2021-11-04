module Admin
  class MyController < Admin::ApplicationController
    before_action :set_user, only: [:index, :edit, :update, :password, :password_update]
    def index

    end

    def edit

    end

    def update
      data = set_data
      if @user.update(data)
        # 更新user session数据
        session[:user] = @user
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @user.errors.messages}
      end
    end

    def password

    end

    def password_update
      password_pre = params[:password_pre]
      password_new = params[:password_new]
      password_again = params[:password_again]
      res = @user.edit_password(@user, password_pre, password_new, password_again)
      if res['code'] == 200
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: res['code'], errors: res['message']}
      end
    end

    def society_change
      society_id = params[:id].to_i
      user_society_ids = Staff.find_user_society_ids(session['user']['id'])
      arr_society_ids = user_society_ids.inject([]) {|result, n| result << n.society_id}
      if arr_society_ids.include?(society_id)
        session[:society_id] = society_id
        session.delete(:role)
        session.delete(:menu_list_id)
        session.delete(:allow_controller)
        render json: { code:200, message: '切换成功', data: {url: '/admin/my?menu_id=5'} }
      else
        render json: { code:201, errors: '所选社团不存在' }
      end
    end

    # 社员通讯录
    def staff
      @staffs = Staff.by_name_phone_search(params['search_key'])
                    .by_society_id(session['society_id'])
                    .get_staffs_info
                    .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
    end

    # 会员通讯录
    def level
      @levels = Level.by_name_student_no_search(params['search_key'])
                    .by_society_id(session['society_id'])
                    .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
    end

    # 公告通知
    def article
      @articles = Article
                      .by_society_id(session['society_id'])
                      .by_name_search(params['search_key'])
                      .order("id desc")
                      .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
    end

    # 活动通知
    def activity
      @activities = Activity
                        .by_society_id(session['society_id'])
                        .by_name_search(params['search_key'])
                        .order("id desc")
                        .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
    end

    # 讨论区
    def board

    end

    # 获取学院和专业的数据，返回二维数据格式
    # 注意 在academies控制器下有这个函数,之所以再写一遍,是为了权限控制
    def get_academy_with_majors
      academy_list = Academy.by_status.order("sort")
      academy_data = academy_list.map{|n| { id: n.id, name: n.name } }
      major_data = []
      academy_list.each_with_index do |item, i|
        major_data[i] = Major.where(academy_id: item.id).map {|n| { academy_id: item.id, id: n.id, name: n.name } }
      end
      data = {}
      data["academy_data"] = academy_data
      data["major_data"] = major_data
      render json: {code: 200, message: 'success', data: data}
    end

    private

    def set_user
      @user = User.find(session['user']['id'])
    end

    def set_data
      data = {
          user_pic: params[:user_pic],
          name: params[:name],
          sex: params[:sex],
          phone: params[:phone],
          academy_id: params[:academy_id],
          major_id: params[:major_id],
          mail: params[:mail],
          location: params[:location],
          native_place: params[:native_place],
          emer_name: params[:emer_name],
          emer_phone: params[:emer_phone],
          update_time: Time.now.inspect
      }
      data.each { |key, value| data.delete(key) if value.blank? }
    end
  end
end