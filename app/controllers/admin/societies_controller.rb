module Admin
  class SocietiesController < Admin::ApplicationController
    before_action :set_society, only: [:show, :edit, :update, :destroy]

    def index
      @societies = StuSociety
                       .by_name_search(params['search_key'])
                       .order("sort")
                       .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
          format.html {render :index }
          format.json { render json: @societies }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      if @society.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @society.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_time] = Time.now.inspect
      res = StuSociety.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      res = @society.can_delete?([Staff,Level,Department,Article,Activity,Attachment],'society_id',@society.id)
      if res==200 && @society.destroy
        render json: {code: 200, message: '删除成功'}
      else
        if res != 200
          errors = '失败,请先删除与社员,会员,部门,公告通知,活动,文件中相关的数据'
        else
          errors = @society.errors.messages
        end
        render json: {code: 201, errors: errors}
      end
    end

    private
    def set_society
      @society = StuSociety.find(params[:id])
    end

    def set_data
      {
          name: params[:name],
          logo: params[:logo],
          sort: params[:sort],
          society_type: params[:society_type],
          status: params[:status],
      }
    end
  end

end