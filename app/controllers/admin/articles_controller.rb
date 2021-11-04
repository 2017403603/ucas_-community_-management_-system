module Admin
  class ArticlesController < Admin::ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = Article
                       .by_society_id(session['society_id'])
                       .by_name_search(params['search_key'])
                       .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
          format.html {render :index }
          format.json { render json: @articles }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      if @article.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @article.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_by] = session["user"]["name"]
      data[:create_time] = Time.now.inspect
      res = Article.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      if @article.destroy
        render json: {code: 200, message: '删除成功'}
      else
        render json: {code: 201, errors: @article.errors.messages}
      end
    end

    private
    def set_article
      @article = Article.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      {
          society_id: session["society_id"],
          title: params[:title],
          abstract: params[:abstract],
          content: params[:content],
          status: params[:status],
          edit_by: session["user"]['name'],
          edit_time: Time.now.inspect
      }
    end
  end

end