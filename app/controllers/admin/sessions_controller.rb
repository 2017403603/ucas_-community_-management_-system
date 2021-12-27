module Admin
  class SessionsController < Admin::ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
      render layout: false
    end

    def create
      user = User.new
      res = user.check_login(params['student_no'], params['password'], params['code'])
      if res['code'] == 200
        user_society_ids = Staff.find_user_society_ids(res['user'].id)
        unless user_society_ids.blank?
          arr_society_ids = user_society_ids.inject([]) {|result, n| result << n.society_id}
          # 信息校验成功,存入相关session, 默认存入第一个社团
          session[:user] = res['user']
          session[:society_id] = user_society_ids.first.society_id
          session[:societies] = StuSociety.where(id: arr_society_ids)
          render json: { code: 200, message: res['message'] }
        else
          session[:user] = res['user']
          user_society_ids = Staff.find_user_society_ids(0)
          arr_society_ids = user_society_ids.inject([]) {|result, n| result << n.society_id}
          session[:society_id] = user_society_ids.first.society_id
          session[:societies] = StuSociety.where(id: arr_society_ids)
          render json: { code: 200, message: res['message'] }
        end
      else
        render json: { code: res['code'], errors: res['message'] }
      end
    end

    def destroy
      reset_session
      redirect_to  index_index_url
    end

  end

end