module Admin
  class StaffsController < Admin::ApplicationController
    before_action :set_staff, only: [:show, :edit, :update, :destroy]

    def index
      @staffs = Staff.by_name_phone_search(params['search_key'])
                    .by_society_id(session['society_id'])
                    .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
        format.html {render :index }
        format.json { render json: @staffs }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      data.delete('create_time')
      user = User.by_status.where(id: data[:user_id]).first
      unless user.blank?
        data[:student_no] = user[:student_no]
        data[:name] = user[:name]
        if @staff.update(data)
          render json: {code: 200, message: '修改成功'}
        else
          render json: {code: 201, errors: @staff.errors.messages}
        end
      else
        render json: {code: 201, errors: '用户不存在'}
      end
    end

    def new

    end

    def create
      data = set_data
      user = User.by_status.where(id: data[:user_id]).first
      unless user.blank?
        data[:student_no] = user[:student_no]
        data[:name] = user[:name]
        res = Staff.create(data)
        if res.new_record?
          render json: {code: 201, errors: res.errors.messages}
        else
          render json: {code: 200, message: '新增成功'}
        end
      else
        render json: {code: 201, errors: '用户不存在'}
      end
    end

    def destroy
      if @staff.destroy
        render json: {code: 200, message: '删除成功'}
      else
        render json: {code: 201, errors: @staff.errors.messages}
      end
    end

    def get_users
      users = User.by_status
      data = users.inject([]) {|result, n| result << {id: n.id, text: "#{n.student_no} #{n.name}"}}
      render json: {code: 200, message: 'success', data: data}
    end

    private
    def set_staff
      @staff = Staff.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      {
          user_id: params[:user_id],
          society_id: session[:society_id],
          department_id: params[:department_id],
          job_id: params[:job_id],
          start_time: params[:start_time],
          end_time: params[:end_time],
          society_admin: params[:society_admin] || 2,
          status: params[:status],
          create_time: Time.now.inspect,
      }
    end
  end

end