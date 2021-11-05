class UsersController < ApplicationController
  def signup
  end

  def  create
      data = set_data
      data[:password] = Digest::SHA1.hexdigest(data[:password])
      res = User.create(data)
      if res.new_record?
        render json: {code: 201, errors: res.errors.messages}
      else
        render json: {code: 200, message: '新增成功'}
      end
  end


  def set_data
    data = {
        student_no: params[:student_no],
        name: params[:name],
        sex: params[:sex],
        phone: params[:phone],
        password: params[:password],
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
