module Admin
  class AttachmentsController < Admin::ApplicationController
    before_action :set_attachment, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token, :only => [:create]
    def index
      @attachments = Attachment
                   .by_society_id(session['society_id'])
                   .by_name_search(params['search_key'])
                   .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
        format.html {render :index }
        format.json { render json: @attachments }
      end
    end

    def show

    end

    def edit

    end

    def update
      data = {status: params[:status]}
      if @attachment.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @attachment.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:create_by] = session["user"]["name"]
      data[:create_time] = Time.now.inspect
      data[:status] = 1
      my_file = MyuploaderUploader.new
      my_file.store_dir = 'uploads/attachments'
      my_file.store!(params[:file])
      data[:random_name] = my_file.filename
      res = Attachment.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      if @attachment.destroy
        render json: {code: 200, message: '删除成功'}
      else
        render json: {code: 201, errors: @attachment.errors.messages}
      end
    end

    private
    def set_attachment
      @attachment = Attachment.by_society_id(session['society_id']).find(params[:id])
    end

    def set_data
      {
          society_id: session["society_id"],
          name: params[:name],
          filesize: params[:size],
      }
    end
  end

end