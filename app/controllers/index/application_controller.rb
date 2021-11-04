module Index
  class ApplicationController < ActionController::Base
    before_action :set_society_id
    layout "index/layouts/application"

    private
    def set_society_id
      session[:index_society] = StuSociety.by_status.by_sort.limit(1).first if session[:index_society].blank?
    end
  end
end
