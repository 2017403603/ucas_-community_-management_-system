class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # 判断是否与其他表存在数据上的关联,删除记录所用
  scope :relate_with_other?, -> key, value { where("#{key} = ?", value).limit(1)}

  # 判断关联的表是否可用删除,如社团staffs,levels,departments,articles,activities,attachments
  def can_delete?(models, key, value)
    code = 200
    models.each do |e|
      unless e.relate_with_other?(key, value).blank?
        code = 201
        break
      end
    end
    code
  end
end
