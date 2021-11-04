module Admin
  class ActivitiesController < Admin::ApplicationController
    before_action :set_activity, only: [:show, :edit, :update, :destroy]

    def index
      @activities = Activity
                       .by_society_id(session['society_id'])
                       .by_name_search(params['search_key'])
                       .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
          format.html {render :index }
          format.json { render json: @activities }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      if @activity.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @activity.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_by] = session["user"]["name"]
      data[:create_time] = Time.now.inspect
      res = Activity.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      if @activity.destroy
        render json: {code: 200, message: '删除成功'}
      else
        render json: {code: 201, errors: @activity.errors.messages}
      end
    end

    private
    def set_activity
      @activity = Activity.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      {
          society_id: session["society_id"],
          name: params[:name],
          content: params[:content],
          apply_start_time: params[:apply_start_time],
          apply_end_time: params[:apply_end_time],
          status: params[:status]
      }
    end
  end

end