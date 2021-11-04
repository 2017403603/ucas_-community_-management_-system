module Admin
  class VotesController < Admin::ApplicationController
    before_action :set_vote, only: [:show, :edit, :update, :destroy, :vote]
    before_action :check_can_update, only: [:update]

    def index
      @votes = Vote
                   .by_society_id(session['society_id'])
                   .by_name_search(params['search_key'])
                   .order("id desc")
                   .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
          format.html {render :index }
          format.json { render json: @votes }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = set_data
      res = (Vote.new).update_vote_with_vote_options(data, @vote)
      if res
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @vote.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_time] = Time.now.inspect
      data[:user_id] = session["user"]["id"]
      data[:create_by] = session["user"]["name"]
      vote = Vote.new
      res = vote.create_vote_with_vote_options(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      if @vote.destroy
        VoteOption.where(vote_id: @vote.id).delete_all
        VoteRecord.where(vote_id: @vote.id).delete_all
        render json: {code: 200, message: '删除成功'}
      else
        render json: {code: 201, errors: @vote.errors.messages}
      end
    end

    # 进行投票
    def vote
      res = @vote.vote(@vote, params[:vote_options], session["user"]["id"])
      if res["code"] == 200
        render json: { code: 200, message: '投票成功' }
      else
        render json: { code: 201, errors: res["message"] }
      end
    end

    # 获取投票和选项的数据，返回二维数据格式
    def get_vote_with_vote_options
      vote_list = Vote.by_society_id(session['society_id']).by_status.order("sort")
      vote_data = vote_list.map{|n| { id: n.id, name: n.name } }
      vote_options_data = []
      vote_list.each_with_index do |item, i|
        vote_options_data[i] = Job.where(vote_id: item.id).map {|n| { vote_id: item.id, id: n.id, name: n.name } }
      end
      data = {}
      data["vote_data"] = vote_data
      data["vote_options_data"] = vote_options_data
      render json: {code: 200, message: 'success', data: data}
    end

    private
    def set_vote
      @vote = Vote.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      {
          society_id: session[:society_id],
          name: params[:name],
          vote_options: params[:vote_options],
          start_time: params[:start_time],
          end_time: params[:end_time],
          content: params[:content]
      }
    end

    # 检查是否可以更新
    def check_can_update
     unless @vote.user_id == session["user"]["id"]
       render json: { code: 403, errors: '失败,没有权限修改' }
       return
     end
       unless VoteRecord.relate_with_other?('vote_id', @vote.id).blank?
         render json: { code: 403, errors: '失败,已经有用户投票过,不能修改' }
       end
    end
  end

end