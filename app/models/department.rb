class Department < ApplicationRecord

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
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
  cattr_accessor :jobs
  after_save :create_jobs

  def create_jobs
    Job.new.create_jobs(id, jobs)
  end

  # 新增部门
  def create_department_with_jobs(data)
    self.jobs = data[:jobs]
    data.delete(:jobs)
    Department.create(data)
  end

  #修改部门
  def update_department_with_jobs(data, department)
    self.jobs = data[:jobs]
    data.delete(:jobs)
    department.update(data)
  end
end
