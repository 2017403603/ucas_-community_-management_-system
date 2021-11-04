module Admin
  class DepartmentsController < Admin::ApplicationController
    before_action :set_department, only: [:show, :edit, :update, :destroy]

    def index
      @departments = Department
                       .by_society_id(session['society_id'])
                       .by_name_search(params['search_key'])
                       .order("sort")
                       .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
          format.html {render :index }
          format.json { render json: @departments }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      res = (Department.new).update_department_with_jobs(data, @department)
      if res
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @department.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_time] = Time.now.inspect
      department = Department.new
      res = department.create_department_with_jobs(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      res = @department.can_delete?([Staff],'department_id',@department.id)
      if res==200 && @department.destroy
        Job.where(department_id: @department.id).delete_all
        render json: {code: 200, message: '删除成功'}
      else
        if res != 200
          errors = '失败,请先删除与社员相关的数据'
        else
          errors = @department.errors.messages
        end
        render json: {code: 201, errors: errors}
      end
    end

    # 获取部门和职位的数据，返回二维数据格式
    def get_department_with_jobs
      department_list = Department.by_society_id(session['society_id']).by_status.order("sort")
      department_data = department_list.map{|n| { id: n.id, name: n.name } }
      jobs_data = []
      department_list.each_with_index do |item, i|
        jobs_data[i] = Job.where(department_id: item.id).map {|n| { department_id: item.id, id: n.id, name: n.name } }
      end
      data = {}
      data["department_data"] = department_data
      data["jobs_data"] = jobs_data
      render json: {code: 200, message: 'success', data: data}
    end

    private
    def set_department
      @department = Department.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      { name: params[:name], jobs: params[:jobs], sort: params[:sort], status: params[:status], society_id: session[:society_id]}
    end
  end

end