namespace :queue_job do
  desc "测试rails的队列，job"
  task test: :environment do
    data = {}
    data['name'] = 'gwei'
    data['sex'] = '男'
    data['age'] = 25
    GuestsCleanupJob.perform_later data
    p 'success to exec the job, see the result at the job.log'
  end

end
