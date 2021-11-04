module Admin
  class AcademiesController < Admin::ApplicationController
    before_action :set_academy, only: [:show, :edit, :update, :destroy]

    def index
      @academies = Academy
                       .by_name_search(params['search_key'])
                       .order("sort")
                       .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
          format.html {render :index }
          format.json { render json: @academies }
      end
    end

    def show

    end

    def edit

    end

    def update
      begin
        academy_data = { name: params[:name], sort: params[:sort], status: params[:status], create_time: Time.now.inspect }
        majors_data  = params[:majors]
        (Academy.new).update_academy_with_majors(academy_data,majors_data,@academy)
        render json: {code: 200, message: '修改成功'}
      rescue Exception => e
        render json: {code: 201, errors: e.message}
      end
    end

    def new

    end

    def create
        begin
          academy_data = { name: params[:name], sort: params[:sort], status: params[:status], create_time: Time.now.inspect }
          majors_data  = params[:majors]
          (Academy.new).insert_academy_with_majors(academy_data,majors_data)
          render json: {code: 200, message: '新增成功'}
        rescue Exception => e
          render json: {code: 201, errors: e.message}
        end
    end

    def destroy
      res = @academy.can_delete?([User],'academy_id',@academy.id)
      if res==200 && @academy.destroy
        Major.where(academy_id: @academy.id).destroy_all
        render json: {code: 200, message: '删除成功'}
      else
        if res != 200
          errors = '失败,请先删除与用户中相关的数据'
        else
          errors = @academy.errors.messages
        end
        render json: {code: 201, errors: errors}
      end
    end

    # 获取学院和专业的数据，返回二维数据格式
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
    def set_academy
      @academy = Academy.find(params[:id])
    end

  end

end