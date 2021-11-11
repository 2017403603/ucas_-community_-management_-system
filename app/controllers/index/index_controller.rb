module Index
  class IndexController < Index::ApplicationController
    before_action :set_menu_name
    def index
      @sliders = Slider.by_status.by_society_id(session["index_society"]["id"]).by_sort
      @articles = Article.by_status.by_society_id(session["index_society"]["id"]).by_create_time.limit(6)
      @activities = Activity.by_status.by_society_id(session["index_society"]["id"]).by_create_time.limit(6)
      @attachments = Attachment.by_status.by_society_id(session["index_society"]["id"]).by_create_time.limit(6)
      @societies = StuSociety.by_status
    end

    def article
      @articles = Article
                      .by_status
                      .by_society_id(session["index_society"]["id"])
                      .by_create_time
                      .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
    end

    def article_detail
      @article =  Article.by_status.by_society_id(session["index_society"]["id"]).find(params[:id])
      redirect_to '/404.html' if @article.blank?
    end

    def activity
      @activities = Activity
                        .by_status
                        .by_society_id(session["index_society"]["id"])
                        .by_create_time
                        .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
    end

    def activity_detail
      @activity =  Activity.by_status.by_society_id(session["index_society"]["id"]).find(params[:id])
      redirect_to '/404.html' if activity.blank?
    end

    def attachment
      @attachments = Attachment
                        .by_status
                        .by_create_time
                        .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
    end

    def society
      @societies = StuSociety
                      .by_status
                      .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      @introduce = Introduce.find_society_introduce(session["index_society"]["id"]).first
    end

    def society_detail
      
      @introduce = Introduce.find_society_introduce(session["index_society"]["id"]).first
    end

    def change
      society_id = params[:id]
      session[:index_society] = StuSociety.by_status.find(society_id)
      redirect_to '/index/index'
    end

    # 获取所有社团
    def get_societies
      societies = StuSociety.by_status.by_sort
      data = societies.inject([]) {|result, n| result << {id: n.id, text: n.name}}
      render json: {code: 200, message: 'success', data: data}
    end

    private
    # 设置导航默认选中
    def set_menu_name
      action = params[:action]
      case action
        when "index"
          @menu_name = "menu-index"
        when "article"
          @menu_name = "menu-article"
        when "article_detail"
          @menu_name = "menu-article"
        when "activity"
          @menu_name = "menu-activity"
        when "activity_detail"
          @menu_name = "menu-activity"
        when "attachment"
          @menu_name = "menu-attachment"
        when "society"
          @menu_name = "menu-society"
        else
          @menu_name = "menu-index"
      end
    end
  end
end