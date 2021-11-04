module Admin
  class SlidersController < Admin::ApplicationController
    before_action :set_slider, only: [:show, :edit, :update, :destroy]
    def index
      @sliders = Slider
                     .by_society_id(session['society_id'])
                     .order(:sort)
                     .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
        format.html {render :index }
        format.json { render json: @sliders }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      if @slider.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @slider.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_by] = session["user"]["name"]
      data[:create_time] = Time.now.inspect
      res = Slider.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      if @slider.destroy
        render json: {code: 200, message: '删除成功'}
      else
        render json: {code: 201, errors: @slider.errors.messages}
      end
    end

    private
    def set_slider
      @slider = Slider.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      {
          society_id: session["society_id"],
          random_name: params[:random_name],
          href: params[:href],
          sort: params[:sort],
          status: params[:status]
      }
    end
  end

end