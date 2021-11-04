class Job < ApplicationRecord
  validates :name,
            presence: { message: "名称不能为空" },
            length: { in: 1..45, message: "名称长度在1-45个字符内" }

  def create_jobs(department_id, jobs)
    Job.where(department_id: department_id).destroy_all
    unless jobs.blank?
      job_arr = jobs.map {|e| {department_id: department_id, name: e}}
      Job.create(job_arr)
    end
  end
end