module Admin
  # s社团简介 只有一篇文章
  class IntroducesController < Admin::ApplicationController
    before_action :set_introduce, only: [:index, :edit, :update]
    def index
      if @introduce.blank?
        redirect_to '/admin/introduces/new'
      else
        redirect_to "/admin/introduces/#{@introduce.id}/edit"
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_by] = session["user"]["name"]
      data[:create_time] = Time.now.inspect
      Introduce.by_society_id(session["society_id"]).delete_all
      res = Introduce.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def edit

    end

    def update
      data = set_data
      if @introduce.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @introduce.errors.messages}
      end
    end

    private
    def set_introduce
      @introduce = Introduce.find_society_introduce(session["society_id"]).first
    end

    def set_data
      {
          society_id: session["society_id"],
          status: 1,
          content: params[:content]
      }
    end

  end
end