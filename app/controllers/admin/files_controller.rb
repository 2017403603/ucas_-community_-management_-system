module Admin
  class FilesController < Admin::ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:article_file_upload, :society_pic_upload, :user_pic_upload]
    def article_file_upload
      keys = params.keys
      keys.delete('controller')
      keys.delete('action')
      data = []
      keys.each do |e|
        up_file = params[e]
        my_file = MyuploaderUploader.new
        my_file.store_dir = 'uploads/articles'
        my_file.store!(up_file)
        data << "/uploads/articles/#{my_file.filename}"
      end
      render json: {errno: 0, data: data}
    end

    # webuploader 上传图片接口,单张图片
    def society_pic_upload
      my_file = MyuploaderUploader.new
      my_file.store_dir = 'uploads/societies'
      my_file.store!(params[:file])
      data = {}
      data[:random_name] = my_file.filename
      render json: { code: 200, message: '上传成功', data: data }
    end

    # webuploader 上传图片接口,单张图片
    def user_pic_upload
      my_file = MyuploaderUploader.new
      my_file.store_dir = 'uploads/users'
      my_file.store!(params[:file])
      data = {}
      data[:random_name] = my_file.filename
      render json: { code: 200, message: '上传成功', data: data }
    end
  end

end