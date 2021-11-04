module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = User.by_name_student_no_search(params['search_key'])
                    .paginate(page: params['page'] || 1, per_page: params['per_page'] || 10)
      respond_to do |format|
        format.html {render :index }
        format.json { render json: @users }
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
      if @user.update(data)
        render json: {code: 200, message: '修改成功'}
      else
        render json: {code: 201, errors: @user.errors.messages}
      end
    end

    def new

    end

    def create
      data = set_data
      data[:password] = Digest::SHA1.hexdigest('123456')
      res = User.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
    end

    def destroy
      res = @user.can_delete?([Staff],'user_id',@user.id)
      if res==200 && @user.destroy
        render json: {code: 200, message: '删除成功'}
      else
        if res != 200
          errors = '失败,请先删除与社员相关的数据'
        else
          errors = @user.errors.messages
        end
        render json: {code: 201, errors: errors}
      end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def set_data
      data = {
          student_no: params[:student_no],
          name: params[:name],
          sex: params[:sex],
          phone: params[:phone],
          academy_id: params[:academy_id],
          major_id: params[:major_id],
          mail: params[:mail],
          location: params[:location],
          native_place: params[:native_place],
          emer_name: params[:emer_name],
          emer_phone: params[:emer_phone],
          system_admin: params[:system_admin],
          status: params[:status],
          create_time: Time.now.inspect,
          update_time: Time.now.inspect
      }
      data.each { |key, value| data.delete(key) if value.blank? }
    end
  end

end