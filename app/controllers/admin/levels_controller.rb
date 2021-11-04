module Admin
  class LevelsController < Admin::ApplicationController
    before_action :set_level, only: [:show, :edit, :update, :destroy]

    def index
      @levels = Level.by_name_student_no_search(params['search_key'])
                    .by_society_id(session['society_id'])
                    .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
        format.html {render :index }
        format.json { render json: @levels }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      data.delete('student_no')
      data.delete('create_time')
      if @level.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @level.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      res = Level.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      if @level.destroy
        render json: {code: 200, message: '删除成功'}
      else
        render json: {code: 201, errors: @level.errors.messages}
      end
    end

    private
    def set_level
      @level = Level.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      data = {
          society_id: session[:society_id],
          student_no: params[:student_no],
          name: params[:name],
          start_time: params[:start_time],
          end_time: params[:end_time],
          sex: params[:sex],
          phone: params[:phone],
          academy_id: params[:academy_id],
          major_id: params[:major_id],
          mail: params[:mail],
          location: params[:location],
          native_place: params[:native_place],
          emer_name: params[:emer_name],
          emer_phone: params[:emer_phone],
          status: params[:status],
          create_time: Time.now.inspect,
          update_time: Time.now.inspect
      }
      data.each { |key, value| data.delete(key) if value.blank? }
    end
  end

end