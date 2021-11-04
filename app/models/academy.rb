class Academy < ApplicationRecord

  validates :name,
            presence: { message: "名称不能为空" },
            length: { in: 1..45, message: "名称长度在1-45个字符内" }
  validates :sort,
            presence: { message: "排序不能为空" },
            numericality: { only_integer: true, message: "排序只能为整数" }
  validates :status,
            presence: { message: "状态不能为空" },
            numericality: { only_integer: true, message: "状态只能为整数" }

  scope :by_name_search, -> name { where("name like ?", "%#{name}%") if name.present? }
  scope :by_status, -> { where(status: 1) }

  #新增学院和专业
  def insert_academy_with_majors(academy_data,majors_data)
    ActiveRecord::Base.transaction do
      res = Academy.create(academy_data)
      raise res.errors.messages.first[1].to_s if res.new_record?
      unless res.new_record?
        unless majors_data.nil?
          insert_majors_data = majors_data.map do |item|
            {name: item, academy_id: res.id}
          end
          Major.create(insert_majors_data)
        end
      end
    end
  end

  #修改学院和专业
  def update_academy_with_majors(academy_data,majors_data,academy)
    ActiveRecord::Base.transaction do
      res = academy.update(academy_data)
      raise academy.errors.messages.first[1].to_s unless res
      Major.where(academy_id: academy.id).delete_all
      unless majors_data.nil?
        insert_majors_data = majors_data.map do |item|
          {name: item, academy_id: academy.id}
        end
        Major.create(insert_majors_data)
      end
    end
  end

end
